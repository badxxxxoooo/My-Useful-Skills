---
name: gmail-send
description: "Send email via user's Gmail API. Use when 让 Hermes 发邮件。"
version: 1.0.0
author: Hermes curator
license: MIT
metadata:
  hermes:
    tags: [Gmail, email, API, sending]
    related_skills: [google-workspace, himalaya]
---

# Gmail 发邮件（用户 Gmail API 已配置）

## When to Use
用户要求写/发/回复邮件（尤其客服往来、英文收件人），或需要从用户 Gmail 查找历史邮件时。

用户 Gmail：shesaidwait@gmail.com。**英文名/签名是 Carmy**（不是 Gmail 显示名 Six Old）。Gmail API 已授权，token 在 `~/AppData/Local/hermes/google_token.json`（自动刷新）——发邮件走 API，**不要用浏览器自动化**：Chrome 拒绝后台文本输入，会弹到前台抢焦点（用户明确反感）。

## 快捷路径

```bash
GAPI="python C:/Users/ASUS/AppData/Local/hermes/skills/productivity/google-workspace/scripts/google_api.py"
$GAPI gmail search "关键词" --max 5     # 找历史往来，拿完整收件人地址
$GAPI gmail get MESSAGE_ID              # 读单封（HTML-only 邮件 body 可能为空，见 Pitfalls）
$GAPI gmail reply MESSAGE_ID --body "..."   # 回复线程（保持会话连续，最常用）
$GAPI gmail send --to x@y.com --subject "..." --body "..."
```

## 用户偏好（必须遵守）
1. **签名用 Carmy**（不是 Six Old、不是中文名）。
2. 收件人是英文客服、用户是中文时，**发送前给中英对照版预览**，等用户确认再发。
3. 已有往来线程时用 `gmail reply` 接续（客服能看到上下文），别开新邮件。
4. 收件人地址：先 `gmail search` 公司名，用**最新一封邮件的 From** 作为回复对象（完整地址在 search 结果里；同一公司可能有多个客服邮箱，认准最新发件人）。

## Pitfalls
- **gmail get 对 HTML-only 邮件返回空 body**：改用原始 Gmail API（urllib + Bearer token 读 google_token.json），`format=full` 后遍历 `payload.parts`，text/plain 直接 `base64.urlsafe_b64decode`，text/html 去标签。
- 本机 google-workspace 的 setup.py 是旧版：`--auth-url` 不接受文档里的 `--services email --format json`（报 unrecognized arguments）；用裸 `--auth-url`（默认请求全 scope，可接受）。
- 浏览器兜底（仅当 API 不可用时）：Chrome 后台文本输入被拒（`Chrome_WidgetWin_1`）→ 必须 `delivery_mode=foreground`，会**闪窗口**；长文本 SendInput 会**丢后半段**（约 350 字符以上分段输入），用 Ctrl+A/Ctrl+C + `powershell Get-Clipboard -Raw` 验证实际输入；cua_browser typed 通道需 browser_prepare 授权 existing-profile（standard 模式会被拒）。

## 参考
- `references/atlantic-cigar-892635.md` — 进行中的雪茄退货/重发跟进线程（订单 #892635）。
