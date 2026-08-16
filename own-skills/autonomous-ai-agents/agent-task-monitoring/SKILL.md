---
name: agent-task-monitoring
description: Use when 派发后台长任务给外部 agent 需监控：watchdog 模式（结构保证、产出判定、验证留痕）。
version: 1.0.0
author: Hermes Agent
license: MIT
platforms: [windows, macos, linux]
metadata:
  hermes:
    tags: [watchdog, monitoring, codex, background-task, verification, reliability]
    related_skills: [task-router, codex, verification-before-completion]
---

# Agent 后台任务监控（Watchdog 模式）

派发长任务给外部 agent 后，如何可靠地监控「完成 / 卡死 / 结束」，以及如何让「规则写了」变成「结构保证」。本 skill 是模式论（通用）；具体环境绑定见 `task-router` skill（用户实例：codex-dispatch.sh / watchdog_codex.py / codex-watchdog cron）。

## When to Use

- 用 `codex exec` / `claude` / 子代理跑后台长任务，需要知道它何时完成、是否卡死
- 任何「靠 LLM 记得做某事」的后台流程想改成结构保证
- 任务可能长时间无输出、或写完挂起不退出

## 核心原则（实测教训，2026-08）

1. **结构保证 > 文字规则**。LLM 没有定时器，「记得 poll / 记得 start watchdog」都是可丢失的。把关键步骤写进**流程结构**（脚本顺序、退出码、trap）而不是 skill 文字。
2. **判定以产出为准，别等进程退出**。agent 写完代码后**挂起不退出是常态**（tokens 停止、进程还活着）。判断完成看：git commit 落库 + 文件 mtime + tokens 停住。
3. **告警走标记文件 + 每轮检查**。cron/投递通道可能不可靠（桌面会话收不到推送）。用「写标记文件 → 会话每轮开始时读取（读即清除）」兜底。
4. **终态必须验证留痕才能汇报完成**（防谎报）。「Codex 说完成」不是证据；验证门要机制化（见下文 VERIFY-REQUIRED）。

## 模式组件（每个都是被验证过的构建块）

### 1. ARM-FIRST + HARD GATE（装弹先于派发）
把「启动监控」和「派发任务」合成一条命令，装弹发生在任务启动**之前**：
```
1. 前置校验（git 仓库等）
2. ARM FIRST：写监控 state（预期产出 N）
3. HARD GATE：status 未武装 → 退出码 1 → 派发失败，绝不带着未监控的任务发车
4. RUN：任务前台执行（继承 PTY）
5. EXIT：trap 兜底清 state（正常/kill/报错三条路都清）
```
关键：`status` 在「无任务」时必须返回非零退出码——否则硬门形同虚设（永远通过）。

### 2. 完成判定：文件活动 + 预期产出
- 文件 mtime 超过阈值（如 30 分钟）未变 = 疑似卡死/结束
- 有预期产出数（如 `--commits N`）：实际产出 ≥ N = **已完成**（不是卡死）——agent 写完挂起是正常现象
- 优先用「预期产出达标」判断，别依赖进程存活

### 3. 告警标记文件（投递不可靠时的兜底）
- 终态（完成/结束/卡死）→ 写 `~/.<tool>-alert.json`（含 ts/message）
- Hermes 每轮对话开始：读标记（读即清除）→ 有告警先处理
- 双通道：有投递能力的通道（Telegram 等）可走 deliver；标记文件是离线兜底

### 4. 串行保护（单槽位 state）
watchdog state 通常是单槽位（一个 JSON 文件）——并行派发会互相覆盖。派发前先查占用：已占用 → 拒绝并行。多任务需求 = 排队串行，别并行。

### 5. VERIFY-REQUIRED 验证留痕门（防谎报）
- 任何终态（done/ended/stalled）→ 写 `~/.<tool>-verify-required.json`（task/workdir/reason）
- 每轮检查时顺带报告 VERIFY-REQUIRED
- 汇报「完成」前必须：跑验证（分档：full gate = 大活；quick gate = scope 检查 + 1 条真实命令 + 1 行证据）→ 留存证据文件 → `verify-clear <evidence>`（**无证据拒绝清除，exit 1**）→ 才可汇报
- 项目无测试也要写明（「命令试了 + 为什么 N/A」），「看起来没问题」不是证据

## Pitfalls

- **agent 写完挂起不退出是常态**：别等进程退出，kill 僵尸直接进验证门。Hermes 的 process poll 显示 "running" 有滞后/幻觉——以 commit + tokens 停止为完成信号。
- **进程信息不可靠**：外部 agent 若是宿主 PTY 子进程，`tasklist`/`wmic` 查不到任务信息。cmdline_hint 匹配可能命中脚本自身进程（命令行含 workdir 名）——无害但要意识到。
- **快任务直接退出不会触发完成告警**：任务 <1 分钟内完成并退出
——属正常现象；"已完成"告警主要服务"写完挂起"场景。
- **验证门证据防"空壳"**：verify-clear 校验证据 ≥3 行 + 含命令/结果特征行（宽松匹配），随手建的空文件会被拒（exit 1）。
- **hooks/插件注入是最后闭环**：桌面端（serve 路径）不注册 shell hooks——用用户插件（register_hook("pre_llm_call")）补上；插件是 opt-in，必须 `hermes plugins enable <name>` 才加载。
- **MSYS/Windows 路径坑**：native 工具（python 等）不认 `/c/...` MSYS 路径，传 `C:/...` 正斜杠；证据文件存约定目录 `~/.codex-verify-evidence/`。

## 30 秒自检（验证自己用对了）

```bash
python .../watchdog_codex.py self-test    # 6/6 全过 = 链路无回归
python .../watchdog_codex.py verify-stats # 看打回率/一次通过率
```

## 与具体实例的关系

- 本 skill = **模式论**（通用 watchdog 模式，任何 harness 可用）
- `task-router` = **用户实例**（codex-dispatch.sh / watchdog_codex.py / codex-watchdog cron / codex-watchdog 插件）
- 新环境：先读本 skill 建模式，再按 task-router 实例落地
