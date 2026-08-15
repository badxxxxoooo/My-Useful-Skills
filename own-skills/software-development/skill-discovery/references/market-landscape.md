# Agent Skill 市场全景（2026-08 实测数据）

本文件记录 2026-08 会话中通过 gh API 实测验证的星数排行与判例，用于 skill 评估时的横向参照。

## Skill 生态头部（不是几百星！）

| 仓库 | Stars | 说明 |
|---|---|---|
| obra/superpowers | ~272k | Agent 技能框架 + 软件开发方法论，skill 生态绝对王者 |
| anthropics/skills | ~169k | Anthropic 官方 Agent Skills 仓库 |

**关键认知**：SKILL.md 格式 2025 年底才兴起，但生态头部已是十万星级。百星级 skill 已是细分领域头部。不要说出"skill 生态 star 天花板只有几百颗"这种错误结论（本会话犯过，被数据打脸）。

## 多智能体编排：两类范式（别混淆）

### 范式一：角色扮演框架（编程库，不是 skill）
| 框架 | Stars | 说明 |
|---|---|---|
| MetaGPT | ~69.8k | "AI 软件公司"角色扮演，最等级森严 |
| AutoGen | ~60.4k | 微软，可编程多 agent |
| CrewAI | ~57k | role-playing agents |
| LangGraph | ~39.7k | agent 协作图编排 |
| OpenAI Swarm | ~21.9k | 官方轻量 handoff |
| CAMEL | ~17.6k | 学术派 |

**这类是 pip install 的代码库，不能装进 Hermes/Codex 当 skill 用。**

### 范式二：编排纪律 skill（装进 agent 用）
| 仓库 | Stars | 平台 | 判例 |
|---|---|---|---|
| oh-my-hermes | ~255 | **Hermes 原生** | 9 个可组合 skill，用 delegate_task；对 Hermes 用户最适配 |
| am-will/swarms | ~226 | Claude Code + Codex | 依赖感知计划 + 并行波次 |
| oil-oil/codex-team-mode | ~96 | Codex 专属 | 3 角色+哨兵守卫；⚠️ agent TOML 硬编码 gpt-5.6-luna/terra，DeepSeek 环境需改且 spawn_agent 未验证 |
| Azure99/ultra-goal | ~32 | Codex+Claude | 无人值守长任务，中文文档好 |
| Yuri-NagaSaki/subagent-skills | ~11 | Codex/Claude/Pi | Sol+Luna 分层，同 OpenAI 生态 |

**star 高 ≠ 适配**：对用户（Hermes + DeepSeek）oh-my-hermes 255★ 比 codex-team-mode 96★ 更合适，因为后者绑定 OpenAI 模型栈且机制未验证。

## 关键判例（评估方法论的实际案例）

### whathappened (kunchenguid, ~221★)
- X 平台舆情简报 skill：自适应时间窗 + 5 车道搜索格 + 反幻觉护栏
- **❌ 装不了**：SKILL.md 硬规则要求 `x_keyword_search`/`x_semantic_search`/`x_thread_fetch`/`x_user_search` 4 个原生工具，**仅 Grok Build 提供**；README 明说 "Other agents can install the package; they cannot run it for real"
- 教训：Grok-only 依赖写在 SKILL.md 硬规则里，README 也标了——评估时读 SKILL.md 正文，别只看 README 宣传
- 可借鉴：简报模板 + 失败模式设计（references/failure-modes.md 的 7 种失败场景处理）

### codex-team-mode (oil-oil, ~96★)
- 三个角色 TOML + default 哨兵（fail-closed 派发守卫），派发包机制（Outcome/Benefit/Sources/Scope/Checks/Stop when/Return）
- **🟡 需改**：agents/*.toml model = "gpt-5.6-luna"/"gpt-5.6-terra" 写死；DeepSeek custom provider 下 spawn_agent 的 agent_type 是否暴露需探针验证（本会话实测 `~/.codex/agents/` 不存在、config 是 custom provider）
- 价值：SKILL.md 本体的编排纪律通用，角色 TOML 是 OpenAI 栈专属

### graph-engineering (codejunkie99, ~401★)
- 知识图谱 9 阶段管线 + 任务图编排，源自东南大学研究生课程（npubird/KnowledgeGraphCourse 4.4k★）
- ✅ 纯文档型，零依赖，Hermes/Codex 都适用
- 亮点：质量门 ≥90% 精度、融合是最易翻车处、溯源强制

### 其他 2026-07/08 值得留意
- SimpleEnglish (AminBlg, ~2333★)：ASD-STE100 简化技术英语写作，实测违规 -72.9%
- story-to-handdrawn-video (~1369★)、shuohao-skills (~1336★)：中文内容创作类爆发（短剧/手绘视频）
- paper-radar (tigerless-labs, ~19★)：28 家科技大厂 arXiv 论文雷达，纯 stdlib 零依赖

## 用户环境事实（评估 skill 的固定参照）

- Windows；Hermes + Codex CLI 双平台；DeepSeek v4-pro/v4-flash（custom provider，直连 api.deepseek.com，大陆无 VPN）
- Hermes 本地 skills：superpowers 10 个已装（brainstorming/writing-plans/executing-plans/subagent-driven-development/dispatching-parallel-agents/using-git-worktrees/verification-before-completion/finishing-a-development-branch/receiving-code-review/writing-skills）
- Codex ~/.codex/skills/：superpowers 8 个已装（平铺结构）
- Codex 配置：model_provider=custom, model=deepseek-v4-pro, base_url=127.0.0.1:15721 (cc-switch 中转)
- **评估任何多 agent 类 skill 前，先确认用户本地是否已有 superpowers 等价物**
