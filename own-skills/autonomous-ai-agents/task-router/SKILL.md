---
name: task-router
description: "Route: light→Hermes, heavy→Codex. Trigger: unnamed executor."
version: 1.0.0
author: Hermes Agent (created for user Carmy)
license: MIT
platforms: [linux, macos, windows]
metadata:
  hermes:
    tags: [task-routing, delegation, codex, workload-analysis, verification]
    related_skills: [codex, requesting-code-review, verification-before-completion, subagent-driven-development]
---

# Task Router

Decide who executes a coding task: **Hermes directly** (lightweight) or **Codex CLI** (heavy code work). Analyze the workload BEFORE starting, unless the user explicitly names the executor.

## When to Use

- User gives a coding/programming task without saying who runs it ("帮我写个 X" / "实现 Y" / "修一下 Z")
- User says "用 codex 帮我…" (force Codex) or "你直接跑" (force Hermes) — obey, skip analysis
- A Hermes session is about to take on work that would bloat its context; consider routing to Codex

## Decision Hierarchy (strict order)

1. **User explicitly names the executor** — obey unconditionally, skip analysis:
   - "用 codex 帮我…" / "直接用 codex 跑" → delegate to Codex
   - "你直接跑" / "你自己来" → Hermes executes
2. **User did not specify** → run the workload analysis below, then route.

Never ask "要我怎么做?" when the analysis gives a clear answer. Only ask when the task is genuinely ambiguous after analysis.

## Workload Analysis (light vs heavy)

**LIGHT → Hermes runs directly.** Signals (any of):
- Single file / few-file edits, small bug fix, one-off script
- Data munging, text/document work, Q&A, explanation
- Task completable in one coherent pass without deep project context
- Task is quick enough that delegation overhead (briefing + handoff) exceeds execution

**HEAVY → delegate to Codex.** Signals (any of):
- 3+ files touched, cross-module / cross-package changes
- Full feature implementation, refactor, or multi-step build
- Requires writing NEW tests and running the test suite
- Long-context work where losing earlier details would hurt quality
- Any task that would bloat this Hermes session's context

**AMBIGUOUS → default to Hermes first.** Start with Hermes; escalate to Codex only if the task turns out bigger than expected (context bloat, repeated errors, discovery of wide blast radius). This matches the user's cost sensitivity: DeepSeek is cheap, small-step trial costs little.

## Delegating to Codex

1. **Preconditions:** target must be inside a git repo (Codex refuses otherwise). For scratch work: `cd $(mktemp -d) && git init`.
2. **Invoke** per the `codex` skill: `terminal(command="codex exec --sandbox workspace-write '<task>'", workdir="<repo>", background=true, pty=true)` — always `pty=true`, background for long tasks.
3. **Tell the user** the task is running in Codex and that it shares ~/.codex with Codex Desktop (they can watch it there).
4. **Monitor with watchdog discipline — HARD mechanism, not good intentions.** Do NOT rely on "remembering to poll" — an LLM in a conversation has no timer and will silently forget (real incident: Codex stalled 90 min in a retry loop while Hermes did other work). Instead:
   - **After dispatching, immediately run:** `python C:/Users/ASUS/AppData/Local/hermes/scripts/watchdog_codex.py start --pid <PID> --workdir <repo> --task "<desc>" --threshold 30`
   - A cron job (`codex-watchdog`, every 10 min, no_agent, deliver=origin) then automatically checks: process alive? files modified recently? It stays SILENT when healthy and ALERTS on exit or stall (no file writes for >threshold min while process alive).
   - Verify the watchdog state file exists before telling the user "I'll monitor it". Optionally also poll once after ~2-3 min to confirm Codex entered actual work (not just MCP reconnect noise).
   - When the task finishes (exit notification): run `.../watchdog_codex.py stop` to clear state.
5. **Stall detection (卡死判断)** — suspect a stuck Codex when ANY of:
   - No output AND no file modifications for a long stretch (e.g. >20-30 min) while process still "running"
   - Output repeats the SAME error/failure in a loop (e.g. same test failing, same API error) — it's stuck in a retry cycle, not making progress
   - Token count grows but no files change (burning money on a dead end)
   - Process exited unexpectedly before completing (check `process poll`, exit code)
6. **Stall recovery (先解决问题，再继续)** — when a problem is found, do NOT blindly re-run:
   - Read the log/output first to identify root cause
   - Fix the underlying issue yourself (e.g. wrong API key, missing dependency, broken config, git not initialized)
   - Then resume: restart `codex exec` with the same task if fix was environmental, or take over the remaining work in Hermes
   - Verify the fix actually resolves it (test the failing step directly) before restarting
7. **Failure fallback:** on timeout/error, read the log first. Retry ONCE on transient failure; otherwise take over in Hermes (recover usable artifacts, don't blindly re-run).

## Verification Gate (MANDATORY after any Codex run)

Codex's self-report is NOT evidence. After it finishes, before reporting success:

1. Load `verification-before-completion` — run the real commands (tests, build, lint), read output, confirm exit codes.
2. Load `requesting-code-review` — `git diff` the changes, static scan, quality gates, independent reviewer subagent, auto-fix loop if configured.
3. If the task was in a git repo and user wants it shipped: check status, offer commit/PR per `finishing-a-development-branch`.
4. Report to user: what Codex did, what verification passed/failed, any fixes applied.

## Cost Notes

- Estimate magnitude before dispatching (files / blast radius) and state it briefly to the user.
- Prefer Hermes for small work — avoids double context cost and Codex session overhead.
- Codex's DeepSeek model config is the user's existing setup; do not change model configs without being asked.

## Pitfalls

- **Never claim success from Codex's final message alone** — always verify.
- **Codex needs a git repo** — forgetting this wastes a dispatch cycle.
- **Don't micro-manage** — but DO watchdog: periodic poll + file-mtime checks catch stalls before they burn an hour of tokens.
- **User instruction beats this skill** — explicit executor naming always wins, including "skip analysis".
- **Closing Hermes kills background Codex** — background processes spawned via terminal are children of Hermes; closing the app terminates them mid-run. For long tasks: warn the user not to close Hermes, or suggest `hermes gateway start` (independent background service) so the task survives window close.
- **Extract API keys with `cut -d= -f2-`, never `grep -oE "sk-[a-zA-Z0-9]+"`** — the regex stops at the first `-` inside the key, truncating it (35-char key became 7 chars → HTTP 401 → Codex stuck in retry loop for an hour). Real incident: this exact bug burned 18万 tokens.
- **curl from git-bash mangles Chinese in JSON bodies** — test API endpoints with Python `urllib`/`requests` (UTF-8 safe) instead; the web frontend's fetch is unaffected, so don't "fix" code based on curl failures.
