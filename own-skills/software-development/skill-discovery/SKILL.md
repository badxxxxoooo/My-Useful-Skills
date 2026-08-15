---
name: skill-discovery
description: "Find/evaluate agent skills on GitHub. Use when 找skill."
version: 1.0.0
author: Hermes Agent
license: MIT
platforms: [linux, macos, windows]
metadata:
  hermes:
    tags: [github, skills, discovery, evaluation, research]
    related_skills: [hermes-skill-deployment, skill-repo-sync, github-repo-management]
---

# Skill Discovery & Evaluation (GitHub)

Find and evaluate third-party agent skills (SKILL.md format) on GitHub before installing.
Covers: search recipes, verification workflow, and the evaluation checklist that decides
whether a skill is worth installing for THIS user's environment.

## When to Use

- User asks 找/看看/推荐 agent skill、skill、类似 skill（"GitHub 最近有什么好用的 skill"）
- User points at a repo and asks "这个 skill 值不值得装 / 详细介绍"
- Before installing any third-party skill: evaluate host compatibility FIRST

## Search Recipes (gh CLI)

```bash
# 按关键词 + 创建时间窗 + star 排序
gh search repos "<keyword>" --created ">2026-07-14" --sort stars --limit 15 \
  --json fullName,stargazersCount,description,createdAt,pushedAt

# 关键词轮换（每个都是独立搜索，配额 30/次）
#   "agent skills" / "claude skills" / "codex skills"
#   "agent orchestration skill" / "multi-agent skill" / "subagent skill"
#   "awesome agent skills" / "SKILL.md agent" / "skills collection"
```

- **中文关键词污染严重**：搜"智能记账"类中文词会混入无关/政治内容仓库，优先英文关键词
- 每轮搜 2-3 个不同关键词并行（独立 terminal 调用），再统一筛选
- 聚合类仓库（awesome-*）star 普遍低但信息密度高，值得单独看

## Verification Workflow（装之前必做）

```bash
# 1. 查默认分支（不一定是 main！）
gh api repos/<owner>/<repo> --jq '.default_branch'

# 2. 看仓库结构：确认是真 SKILL.md 格式，不是纯 README 宣传
gh api "repos/<owner>/<repo>/git/trees/<branch>?recursive=1" --jq '.tree[] | .path' | head -40

# 3. 读 SKILL.md 正文（不是 README）评估质量
gh api "repos/<owner>/<repo>/contents/<path>/SKILL.md" -H "Accept: application/vnd.github.raw"
```

质量信号：有 references/ 目录 + 多个 skill（集合）> 单文件；SKILL.md 正文 >50 行（5 行正文 = 理念卡片）；有 tests/scripts 更好。

## Evaluation Checklist（对用户环境的适配性 > star 数）

用户环境：**Windows + DeepSeek（custom provider）+ 大陆无 VPN**。按此过滤：

1. **Host 硬依赖**：SKILL.md 要求 `x_*` 原生工具（Grok Build only）、`spawn_agent`/`agent_type`（OpenAI 官方栈）、macOS-only 脚本 → 本机跑不了，直接标注"装不了/只能借鉴"
2. **硬编码模型**：agent TOML/YAML 里写死 `gpt-5.6-*` 等 OpenAI 模型名 → 装后必须改 model，且 custom provider 下机制（sandbox/reasoning_effort）可能失效，**要先探针验证再承诺满血运行**
3. **star 信号**：用户偏好"市场验证过"的高 star 项目；SKILL.md 生态 2025 年底才兴起，头部是 obra/superpowers(~270k) 和 anthropics/skills(~170k)，百星级已属头部 skill。**star 高 ≠ 适配**（oh-my-hermes 255★ 是 Hermes 原生、codex-team-mode 96★ 是 Codex 专属，选型看环境不看 star 排名）
4. **先查本地**：`ls $HERMES_HOME/skills/` 和 `~/.codex/skills/`——用户两边 skill 已大量部署，常已装有功能等价物（如 superpowers 10+8 个），避免重复推荐
5. **范式区分**：多 agent 编排有两类——"角色扮演框架"（MetaGPT/CrewAI/AutoGen，代码库非 skill）vs "编排纪律 skill"（superpowers subagent-driven-development，装进 agent 用）。用户问"agent 团队"时要讲清这个区别

## 交付格式

- 给出对比表：skill / star / 平台 / 核心理念 / 对本用户的适配度（🟢可用 🟡需改 ❌装不了）
- 对每个候选给出"装不装"结论 + 理由，让用户拍板
- 详情页数据存 `references/market-landscape.md`（本会话验证过的星数排行与判例）

## Pitfalls

- 别凭 README 下结论：README 是宣传，SKILL.md 正文才是机制（whathappened 的 Grok-only 就写在 SKILL.md 硬规则里）
- 别跳过默认分支检查：`master` 的仓库用 main 查会 404
- 别一次只搜一个关键词：多关键词并行才能覆盖 agent-skill 生态
- 别把"框架 star"当"skill star"推荐：MetaGPT 6.9 万★ 是编程框架，不是能装进 Hermes 的 skill
- 评估后如果用户决定装：转 `hermes-skill-deployment`（install 命令 + DANGEROUS 误判绕过）
