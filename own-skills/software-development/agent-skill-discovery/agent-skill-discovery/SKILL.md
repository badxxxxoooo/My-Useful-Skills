---
name: agent-skill-discovery
description: Use when 用户要找/评估 GitHub 上的 agent skills。含搜索配方、质量核验、环境兼容把关。
version: 1.0.0
author: hermes-curator
license: MIT
metadata:
  hermes:
    tags: [github, skills, discovery, evaluation, codex, compatibility]
    related_skills: [hermes-skill-deployment, skill-repo-sync]
---

## When to Use

- 用户说"看看 GitHub 最近有没有实用的 agent skill" / "找一下 xxx 类的 skill"
- 任何 skill 发现、筛选、评估、选型请求（区别于部署/同步：那些走 hermes-skill-deployment 和 skill-repo-sync）

# Agent Skill 发现与评估

用户会定期让 Hermes 去 GitHub 找"最近一个月有什么可用的 agent skill"，并要求挑选推荐。完整流程：搜索 → 筛选 → 深挖验证 → **环境兼容性把关** → 给出装/不装建议。

## 1. 搜索（并行多关键词）

用 gh CLI（用户已认证 badxxxxoooo）。Search API 配额 30 次/分钟，够用。一次并行跑 3-4 组关键词：

```bash
# 近一月窗口 + 按 stars 排序 + JSON 输出（用 python 格式化，避免噪音）
gh search repos "agent skills" --created ">$(date -d '1 month ago' +%Y-%m-%d)" --sort stars --limit 15 --json fullName,stargazersCount,description,createdAt,updatedAt
```

关键词变体：`"agent skills"` / `"claude skills"` / `"codex skills"` / `"awesome agent skills"` / `"SKILL.md agent"` / `"agent skills collection"`。聚合类仓库（awesome-*）星少但值得看内容。

## 2. 深挖验证（不要只看 README 和星数）

```bash
# 目录结构
gh api "repos/<owner>/<repo>/contents" --jq '.[] | "\(.type): \(.path)"'
# 递归树一次看全
gh api "repos/<owner>/<repo>/git/trees/main?recursive=1" --jq '.tree[] | .path'
# 读 SKILL.md（必须 raw Accept header）
gh api "repos/<owner>/<repo>/contents/<path>/SKILL.md" -H "Accept: application/vnd.github.raw"
```

质量信号：
- 标准 frontmatter（name + description），description 写"覆盖什么 + 何时用"（这是触发机制，写不好 agent 就不会用）
- 有 `references/`、`scripts/`、`tests/` → 工程化程度高
- 有 failure-modes.md / 前后 checklist / 可测断言 → 反幻觉做得好
- 声称 benchmark 数据（如"违规减少 72.9%"）→ 加分，但要在仓库里能查到 evals 结果
- SKILL.md 正文只有几行 → 理念卡片级，参考价值 > 实用价值（如 provencher/codex-skills）

## 3. 环境兼容性把关（本用户专属，最重要）

用户环境：Hermes + Codex CLI 0.147.0（custom provider 直连 DeepSeek：deepseek-v4-pro 主 / v4-flash 辅助）、Windows、大陆网络。推荐前逐项核对：

| 坑 | 判断方法 | 处理 |
|---|---|---|
| 硬编码 OpenAI 模型（gpt-5.6-* 等） | 看 agents/*.toml 的 model 字段 | 需改写为 deepseek 模型；sandbox_mode/reasoning_effort 在 custom provider 下是否生效无保证，如实说明 |
| 依赖 spawn_agent / agent_type 自定义角色路由 | `ls ~/.codex/agents/` | 无目录 = 角色没装；该功能是 OpenAI 官方栈专属，DeepSeek 下大概率不可用，需实测 schema，别承诺满血运行 |
| Grok Build 专属（X 原生工具） | README 标 "Grok Build only" | 装不了，只可借鉴方法论（模板/搜索模式/失败模式） |
| macOS-only（如 wechat-exporter） | README 说明 | Windows 跑不了 |
| 依赖被墙服务（X/Google） | 说明 | 大陆不可用，标注 |
| 标准 SKILL.md 格式 | frontmatter 检查 | Hermes/Codex 都能装；用户偏好两边同步部署 |

环境验证命令：`codex --version`、`ls ~/.codex/agents/`、`grep -iE "model|provider" ~/.codex/config.toml`

## 4. 输出与建议

- 按类别分组（开发/数据/创意），表格呈现：星数、用途、点评、**兼容性标注**（⚠️ 符号标坑）
- 每个 skill 给明确结论：装 ✅ / 可选 🟡 / 装不了 ❌ + 理由
- 用户偏好：装前先问一句要装哪几个，不要擅自安装；推荐装 Hermes 时按用户习惯同步部署到 Codex
- 推荐组合给 2-3 个就够，别堆砌

## 用户偏好：星数 = 市场验证（2026-08 明确表达）

用户明确说过"星比较少的不要，我想要 star 多的，因为这样才是被市场验证过的"。**小星 skill 直接降权/不推荐**，除非有特殊理由（如唯一方案）并说明。评估时先报星数再谈别的。

已知的 star 天花板（Skill 生态 vs 框架生态，推荐前先对一下量级）：
- **obra/superpowers ⭐272k** — skill 生态王者（agentic skills 框架+方法论），用户本地已装其 10 个 skill（Hermes 版）
- **anthropics/skills ⭐169k** — Anthropic 官方 Agent Skills 仓库
- 框架级（非 skill，需编程集成，装不进 Hermes/Codex）：MetaGPT ⭐70k、AutoGen ⭐60k、CrewAI ⭐57k、LangGraph ⭐40k、Swarm ⭐22k
- 普通 skill 仓库几十~几百星是常态；只有方法论级项目才上万星

对照结论：用户要"多 agent 团队协作"时，superpowers（已装）就是市场验证过的答案，不必再找小星替代品；"等级森严"式团队（MetaGPT/CrewAI）是框架不是 skill，要讲清楚区别。

## 已评估仓库备忘

详见 references/evaluated-2026-08.md（codex-team-mode、graph-engineering、provencher/codex-skills、whathappened 详细评估 + 当月高分清单 + 趋势观察）。

## 坑

- gh api 读单行文件时 `wc -l` 显示 1，用 `wc -c` 看真实大小
- search API 的 created 过滤用 `--created ">YYYY-MM-DD"`（ISO 日期，引号包住），排序用 `--sort stars`
- 不要凭 README 的 star 数和描述下结论，SKILL.md 本体才是证据；README 可能夸大（如"可安装"但实际跑不起来）
- 推荐前必须过第 3 节兼容性表——这是本用户最在意的点（DeepSeek 环境装 OpenAI 栈 skill = 白装）
