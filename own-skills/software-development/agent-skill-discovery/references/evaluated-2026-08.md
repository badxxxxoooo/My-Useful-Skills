# 2026-08 评估过的 agent skills（GitHub 近一月搜索）

评估时间 2026-08-14，窗口 2026-07-14 ~ 08-14，按本用户环境（DeepSeek + Codex CLI custom provider / Windows / 大陆网络）把关。

## 深入评估的 4 个

### oil-oil/codex-team-mode（96★，中文 README）
- 定位：Codex 多智能体编排。Explorer（只读调研）/ Executor（边界明确实现）/ Reviewer（独立复审）三角色 + default 哨兵守卫（fail-closed，拦截漏填 agent_type 的派发，用最便宜模型兜底路由失误）
- 派发包 7 字段：Outcome / Benefit / Sources / Scope / Checks / Stop when / Return，缺字段不派
- Simplify Review：代码跨 3+ 文件或动共享 API/并发/性能路径时，1 个 Reviewer/视角并行（代码质量/性能/复用），只报发现不直接改
- fork_turns="none"（子代理不继承上下文）；附 scripts/usage_by_model.py 用量审计
- ⚠️ agents/*.toml 硬编码 gpt-5.6-luna/terra；用户 ~/.codex/agents/ 不存在；spawn_agent 的 agent_type 路由是 OpenAI 官方栈功能，DeepSeek custom provider 下需实测 schema
- 结论：SKILL.md 编排纪律通用可装；角色 TOML 系统大概率跑不通，别承诺满血

### codejunkie99/graph-engineering（401★）
- 知识图谱 9 阶段管线：scope→representation→ontology→NER→relation→event→quality gate→fusion→KG×LLM
- 源自东南大学研究生《知识图谱》课程（npubird/KnowledgeGraphCourse，4.4K★，王鹏教授），翻译+LLM 时代适配
- 心法：schema 先行（否则是"带箭头的词云"）；关系动词精确（ACQUIRED 而非 RELATED_TO）；quality gate 50 条样本 ≥90% 精度；知识融合是真实项目死因 #1 不许跳过；每条事实带 source/extracted_at/confidence
- 教学模式锚定用户领域 + 每阶段出图；WORKFLOWS.md 有 9 个可粘贴提示词块（第一个 /kg-tutor 当私教）
- 纯文档零依赖，Hermes/Codex 直接可用 ✅

### provencher/codex-skills（166★）
- 只有 1 个 orchestrate skill，SKILL.md 正文 5 行：reasoning_effort 分级（scout low / 常规 medium / 难 high）+ fork_turns none + 叶子不委派 + 独立所有权
- agents/openai.yaml 只是界面描述（display_name/default_prompt），非可执行配置
- 结论：理念卡片级 🟡，参考价值 > 实用价值

### kunchenguid/whathappened（221★，中文 README）
- X 舆情简报生成器：发生了什么 + 舆论地图 + 实时辩论 + receipts。**Grok Build ONLY**（需 x_keyword_search / x_semantic_search / x_thread_fetch / x_user_search 四个原生 X 工具，缺失即拒绝，禁止伪造）
- 自适应窗口：先脉冲测量事件速度再定模式——Breaking 1-6h / Same-day 24-48h / Story 3-7d / Background 14-30d
- 5 车道搜索格（Top 共识 / Latest 新鲜 / Semantic 语义 / First-party 官方 / Debate 辩论），总 X 调用 8-14 次封顶
- 反幻觉护栏：最多 1 次 web 查找（仅实体解析）；禁编造 posts/handles/互动数据；opinion≠ground truth；输出模板强制 Gaps 节；前后双 checklist
- query-patterns.md（X 搜索操作符配方）和 failure-modes.md（7 种失败场景预案）可迁移复用
- 结论：装不了 ❌；方法论值得收藏（简报模板 + 搜索配方 + 失败模式）

## 多 agent 编排同类横向对比（2026-08-15 补充）

用户问"codex-team-mode 只有 96★ 吗，要 star 多的市场验证过的"——同类的 star 全景：

- **witt3rd/oh-my-hermes 255★（Hermes 原生！）**：9 个可组合 skill（deep-research→deep-interview→ralplan 共识规划→ralph 验证执行→autopilot 全流程）。底层就是 Hermes 的 delegate_task（用户已有），omh-delegate 是防子代理输出丢失的加固包装（作者真实事故：14.8 分钟推理输出写回时丢失）。安装 `hermes skills tap add witt3rd/oh-my-hermes`。**本用户最适配**（Hermes 主用 + DeepSeek，无需改模型）
- **am-will/swarms 226★**：Claude Code + Codex 双平台。依赖感知计划（swarm-planner）+ 并行波次执行（parallel-task，depends_on 驱动）+ tmux 并行实现。⚠️ 绑 OpenAI 模型面
- **Azure99/ultra-goal 32★**：无人值守长任务。prepare-ultra-goal（对齐目标）/ ultra-goal（主控亲做）/ ultra-goal-heavy（全委派+双计划交叉评审+多 agent 交叉验收）。中文文档好，阶段循环+git commit
- **Yuri-NagaSaki/subagent-skills 11★**：Sol+Luna 分层（同 OpenAI 生态）
- **SU0510/codex-orchestrator-skill 2★**：Codex 司令模式，主打省 token（subagent 干高负载读写）

**市场验证真相**：SKILL.md 生态的 star 天花板是 **obra/superpowers ⭐272k**（用户本地已装 10 个）和 **anthropics/skills ⭐169k**（官方）。多 agent 编排的"市场验证版"就是 superpowers 的 subagent-driven-development（27 万★ vs 96★ 差 2800 倍）。框架级（非 skill）：MetaGPT 69.8k / AutoGen 60.4k / CrewAI 57k / LangGraph 39.7k / Swarm 21.9k——但这些是编程库不是 SKILL.md。
结论：用户要"star 多"的编排方案 → 已装的 superpowers 即答案；codex-team-mode 按用户新标准（star 少不装）可以不装。

## 当月其他高分（未深挖，备查）
- AminBlg/SimpleEnglish 2333★：ASD-STE100 简化技术英语写文档，声称违规 -72.9%（6 模型 benchmark）
- gnipbao/story-to-handdrawn-video 1369★：中文故事→手绘日记漫画动画 MP4
- eternityspring/shuohao-skills 1336★：AI 短剧制作全家桶（拆角色/大纲/美术/剧本）
- SeanJ1ang/design-judge-skills 1197★：设计奖项研究/评审/投稿（设计师向）
- RinDig/icm-architect 720★：ICM workspace（文件夹结构即 agent 架构）
- Evianis/travel-photo-abstraction 544★：照片→编辑风抽象（Codex skill）
- bybit-exchange/awesome-skills：svg-diagram 手写 SVG 规范（bybit 官方自用，CJK 安全字体/布局数学）
- tigerless-labs/paper-radar 19★：28 家科技大厂 arXiv 论文雷达，纯 stdlib 零依赖，无状态可复现
- ChloeVPin/tdd-agent-skill：研究支撑 TDD（RED-GREEN-REFACTOR 硬门禁 + 反奖励黑客 + mutation testing）
- robbin/wechat-exporter 202★：微信聊天导出解密（macOS only，Windows 用不了）
- op7418/guizang-sports-skill 101★：FIT/KML 运动数据分析（骑行/跑步），本地 3D 路线

## 当月趋势观察
- 中文内容创作类 skill 爆发（短剧/手绘视频/古诗词视频），国内 AIGC 玩法正在 skill 化沉淀
- 生态从单文件 SKILL.md 走向 集合仓库 + references/ + tests/ + evals 的工程化形态
- 高星仓库集中在内容生成；工程向 skill 星数低但质量常更高（如 paper-radar 的实测结论很扎实）
