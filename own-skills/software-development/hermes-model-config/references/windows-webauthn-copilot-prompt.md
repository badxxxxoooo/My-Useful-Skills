# Windows「插入安全密钥」(WebAuthN) 弹窗排查与根治

## 现象
Windows 周期性（实测约每 1.5h）弹出「插入安全密钥」对话框。用户未配置 Windows Hello 生物识别时，WebAuthN 请求直接走「插入外部硬件密钥」路径 → 弹此框。**点取消无害**：只是后台认证尝试失败，静默跳过，不影响任何已批准操作。

## 排查路径（按顺序）

1. **WebAuthN 事件日志定位调用进程（铁证）**
   ```powershell
   Get-WinEvent -LogName 'Microsoft-Windows-WebAuthN/Operational' -MaxEvents 5
   # 事件 XML 里 <Execution ProcessID='XXXX'/> 就是调用者！
   ```
   事件 1070 `IsUserVerifyingPlatformAuthenticatorAvailable: false` = 平台认证器不可用（无 Hello），所以走外部密钥路径。周期出现 = 定时任务触发。

2. **用 PID 反查进程**：`Get-Process -Id XXXX` 看路径/启动时间 → 确认是不是 Hermes.exe（主进程）。

3. **对照 Hermes 日志时间线**：`~/AppData/Local/hermes/logs/agent.log` 里同时刻若有
   `agent.credential_pool: Copilot token exchange degraded to RAW token (exchange unavailable)`
   → 因果链闭合：Hermes 周期性刷新 Copilot token（从 gh CLI 借用）→ exchange 失败（大陆网络访问 api.githubcopilot.com 受限）→ 触发 GitHub 认证流程 → WebAuthN。

## 根因（用户不用 Copilot 时的典型）
- Hermes 凭证池持有 copilot 凭证（`auth.json` credential_pool，source=`gh_cli`，来自 gh 登录）
- `resolve_copilot_token()` 每次调用**从 gh CLI 借用 token**（`_try_gh_cli_token`），并周期性做 exchange → 触发认证 → WebAuthN
- 用户无 ~/.ssh、git 走 gh HTTPS token——**不是 SSH/FIDO2 key 的问题**（源码 update-remote.ts 的 FIDO2 假设不适用于无 SSH key 的环境）

## 根治（优雅开关，不改 gh 登录）

`hermes_cli/copilot_auth.py` 的 `COPILOT_ENV_VARS = ("COPILOT_GITHUB_TOKEN", "GH_TOKEN", "GITHUB_TOKEN")`：
**只要任一变量被设置（非空），resolve_copilot_token 完全跳过 gh CLI 借用**。

- `.env` 加 `COPILOT_GITHUB_TOKEN=ghp_disabled`
  - ⚠️ 必须用 `ghp_` 前缀：`validate_copilot_token` 只拒绝空值和 `ghp_*`（classic PAT），普通字符串（如 `disabled`）能通过校验会被当真 token 用
  - `ghp_disabled` → validate 拒绝 → 跳过 → `return "", ""`（**连 exchange 都不发生**，最干净）
  - 空值不行：`if val:` 为 False → any_env_var_set=False → 仍走 gh 借用
- 配套清理：
  - `hermes auth remove` 移除凭证池 copilot 条目（或直接改 auth.json）
  - 删 `provider_models_cache.json` 里的 `copilot` 键
- 验证：
  ```python
  import sys; sys.path.insert(0, '<hermes-home>/hermes-agent')
  from hermes_cli.copilot_auth import resolve_copilot_token
  print(resolve_copilot_token())  # → ('', '') 即成功
  ```
- 改前备份 `.env` / `auth.json`。重启 Hermes 桌面 app 生效，观察一个周期（1.5h）。

## 以后想用 Copilot
删掉 `.env` 里那行 `COPILOT_GITHUB_TOKEN=...` 即可恢复（gh 登录仍在）。

## 排查陷阱
- **别被进程名误导**：`codex.exe` 可能是 Codex CLI 的驻留进程（路径含 `node_modules\@openai\codex...\bin\codex.exe`），不是桌面 GUI；用户说「app 没开着」时可信。WebAuthN 事件的 PID 才是唯一铁证。
- **desktop.log 空 ≠ 主进程没活动**：WebAuthN 调用不一定记录在 desktop.log，要用事件日志。
- 弹窗与「删除/审批」操作同时出现时，容易误判为删除操作的确认——实际是独立的凭证刷新认证，取消不影响已批准的删除。
