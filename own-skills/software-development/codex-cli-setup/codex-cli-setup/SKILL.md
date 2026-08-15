---
name: codex-cli-setup
description: Use when 配置/排查 Codex CLI 环境（安装、登录、大陆网络中转、cc-switch 排障、skill 精简）。
version: 1.0.1
author: Hermes Agent
license: MIT
platforms: [windows, macos, linux]
metadata:
  hermes:
    tags: [codex, openai, cli, network, proxy, setup]
    related_skills: [codex, hermes-agent]
---

# Codex CLI 环境配置

Codex（OpenAI 编码 agent）CLI 的安装、登录、网络配置、与桌面应用的关系。
注意区分：内置 `codex` skill 讲的是「如何用 `codex exec` 委托编码任务」；本 skill 讲的是「如何让 CLI 环境本身可用」，尤其是大陆网络场景。

## When to Use

- 用户要装/配 Codex CLI
- Codex CLI 报网络错误、超时、连不上
- 用户问 CLI 和桌面应用是否同步/共享
- 大陆网络环境下让 Codex 工作

## 安装与登录

```bash
npm install -g @openai/codex
codex --version          # 验证
codex login status       # 查看登录状态（"Logged in using ChatGPT" = OK）
```

登录复用的是 `~/.codex/auth.json` 里的 **ChatGPT OAuth token**（access_token / refresh_token / account_id），不是 API key。装完 CLI 通常**不用重新登录**——只要桌面应用已登录，CLI 直接复用。

## CLI 与桌面应用共享 ~/.codex

- 登录、会话历史、配置、`AGENTS.md` 都在 `~/.codex/`，两边互通。
- 会话存 `~/.codex/sessions/YYYY/MM/rollout-*.jsonl`；CLI 跑的会话，桌面应用能看到（可能需刷新/重启才更新索引）。
- CLI 是纯命令行（终端文字界面，`codex` 进入交互式）；桌面应用才有 GUI。用户偏好：自己用时开桌面应用，让 Hermes 代办时用 CLI 后台下发。

## 大陆网络（关键）

OpenAI 官方端点（chatgpt.com / api.openai.com / chat.openai.com）在大陆**裸连不通**（实测 HTTP 000）。需要中转。排查顺序：

```bash
# 1. 确认官方端点是否被墙
curl -sS -o /dev/null -w "%{http_code}\n" --max-time 10 https://api.openai.com

# 2. 查 Codex 是否配了中转
grep -iE "base_url|proxy|endpoint" ~/.codex/config.toml

# 3. 若 base_url 指向本地端口，找中转进程
netstat -ano | grep LISTENING | grep :<port>
```

本机实测（Windows）：用 **cc-switch.exe** 做本地中转，`~/.codex/config.toml` 里：

```toml
base_url = "http://127.0.0.1:15721/v1"
experimental_bearer_token = "PROXY_MANAGED"
```

即 `Codex → 127.0.0.1:15721 (cc-switch) → 上游反代/中转 → OpenAI`。只要中转工具在运行，Codex 在大陆就能正常用；中转一关，Codex 就报网络错误。

## cc-switch 网络栈失效（502 全挂的根因，实测）

**症状**：Codex 所有模型请求报 `502 Bad Gateway: CC Switch local proxy failed ... 转发失败: 上游连接失败: error sending request`，cc-switch 日志持续刷 `FWD-003 Provider 请求失败`。**即使 curl 直连上游（api.deepseek.com）返回 200**——问题在 cc-switch 进程内部，不在上游。

**常见诱因**：暂停 VPN / 网络瞬断后，cc-switch 进程的内部网络栈（连接池/DNS 缓存）不会自动恢复。重启 cc-switch 进程即可解决：

```bash
taskkill /F /PID <pid>                                   # 先杀（taskkill /F 在 git-bash 要分开写 /F /PID）
explorer.exe "D:\Work\cc switch\cc-switch.exe"           # 用 explorer 拉起 GUI 进程（cmd start 可能无效）
sleep 8
curl -s -o /dev/null -w "%{http_code}" http://127.0.0.1:15721/v1/models   # 应 200
```

**诊断陷阱**：用 curl 测 cc-switch 的 `/v1/responses` 端点时，**body 里带中文会误报 500**（`invalid unicode code point`，git-bash 中文编码问题）——用纯 ASCII body 或 Python 测，别把假 500 当故障。

## MCP 通道噪音（非致命，别误杀任务）

Codex CLI 启动时必连 `https://chatgpt.com/backend-api/ps/mcp`（插件市场通道，需 VPN）。无 VPN 时刷 `ERROR ... Reconnecting... 1/5..5/5`，**重试耗尽后自动继续干活，不阻塞模型请求**（模型走 cc-switch 不需要 VPN）。判断任务是否卡死看**文件 mtime / git commit**，不要见 MCP 报错就杀进程。

禁用 `~/.codex/config.toml` 里 `[plugins."..."]` 的 `enabled=false` **不能阻止**该通道（内置行为），无需为此改配置；若已改想恢复：`cp ~/.codex/config.toml.bak-plugins ~/.codex/config.toml`。

## GitHub 直连被重置（大陆网络，与 cc-switch 同场排查）

GitHub 克隆/push 报 `Connection was reset`（`gh repo clone` / `git push` 均挂）时，**别先怀疑 auth**——先查代理进程是否真的在跑。光有服务进程（`FlClashHelperService.exe`）不算，**主程序（`FlClash.exe` + `FlClashCore.exe`）必须活着**，且 mixed-port 有 LISTENING：

```bash
netstat -ano | grep ":7890" | grep LISTENING          # FlClash 默认 mixed-port 7890
explorer.exe "D:\\System\\FlClash\\FlClash.exe"        # 没监听就启动主程序（explorer 拉起最可靠）
curl -s -o /dev/null -w "%{http_code}" -x http://127.0.0.1:7890 https://github.com   # 应 200
git config --global http.proxy http://127.0.0.1:7890  # 配全局代理（一次配好）
git config --global https.proxy http://127.0.0.1:7890
```

注意：配了全局 git 代理后，FlClash 关闭时 git 会失败（`--unset` 可还原）。真实 incident (2026-08)：cc-switch 502 排查时发现 FlClash 只剩 HelperService、GitHub push 全部 Connection reset；启动主程序 + 配代理后恢复。这也解释了为什么 Codex 无 VPN 时 MCP 报错但模型能用——模型走 cc-switch（国内直连），MCP 走 chatgpt.com（需 FlClash）。

## 精简 Codex skill

Codex 会把 `~/.codex/skills/` 里所有 skill 的描述塞进上下文，太多会触发「Skill descriptions were shortened」且每次调用烧大量 token。可删的：

- 依赖未装运行时的框架绑定 skill（如 bun/gstack 系列，运行时没装就是死重）
- 空壳/占位（description 是模板占位符，如 write-a-skill）
- Claude Code 专属（配 Claude hooks 的）
- 与 `~/.codex/skills/.system/` 内置重复的（如 skill-creator）
- 命名冲突 wrapper（如 matt-pocock-skills）

## Pitfalls

- Codex 必须在 git 仓库里跑（拒绝非 git 目录）；scratch 用 `mktemp -d && git init`。
- 交互式要用 pty；一次性用 `codex exec "..."`；长任务后台 + 监控。
- 中转工具（cc-switch）必须保持运行，否则 Codex 连不上——这不是 Codex 坏了，是网络路径断了。
- 极简任务也可能烧上万 token（skill 描述全塞进上下文）；先精简 skill 再谈省钱。
