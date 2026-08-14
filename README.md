# My Useful Skills

A personal collection of useful third-party Codex/Claude-style skills installed on 2026-05-20.

This repository packages skills from third-party or personal-developer sources. Official Anthropic/OpenAI/system skills are intentionally excluded from this collection.

## 中文说明

这是一个个人常用 Skill 集合，整理了我在 2026-05-20 安装的第三方/个人开发者来源的 Codex、Claude 风格 skills。

这个仓库主要用于：

- 备份已经安装过的常用 skills。
- 快速迁移到新的 Codex 环境。
- 查看每个 skill 的用途和原始说明。
- 按来源区分不同作者的工作流集合。

本仓库有意排除了 Anthropic、OpenAI、系统内置等官方 skill，只保留第三方或个人开发者来源的 skill。

## Sources

- Vercel Labs: `vercel-labs/skills`
- Superpowers: `obra/superpowers`
- Gstack: `garrytan/gstack`
- Matt Pocock: `mattpocock/skills`
- UI/UX Pro Max: `nextlevelbuilder/ui-ux-pro-max-skill`
- Baoyu Skills: `JimLiu/baoyu-skills`

## 来源说明

- Vercel Labs：用于发现、搜索和安装更多 agent skills。
- Superpowers：偏严格开发流程，强调先澄清、再计划、再执行、最后验证。
- Gstack：偏完整工程工作流，覆盖计划、执行、评审、发布、上下文管理等。
- Matt Pocock：偏工程师日常工作方法，适合 TDD、诊断、PRD/issues 拆解和架构改善。
- UI/UX Pro Max：偏 UI/UX 设计、视觉风格、设计系统和前端界面优化。
- Baoyu Skills：偏内容生产、翻译、图片、图文卡片、公众号/社媒发布等工作流。

## 中文分类速览

### Find Skills - Vercel Labs

用于查找是否已有合适 skill，并辅助安装更多 skill。

### Superpowers - obra

适合需要严格流程的开发任务，例如头脑风暴、写计划、执行计划、调试、TDD、代码评审、完成前验证等。

### Gstack - garrytan

适合长期项目或复杂工程流程，包括自动计划、上下文保存/恢复、评审、QA、发布、部署、复盘、浏览器辅助和团队化 agent 工作流。

### Matt Pocock

适合具体工程动作，例如测试驱动开发、问题诊断、把想法转成 PRD 或 issues、架构改善、任务移交、文章编辑和个人生产力流程。

### UI UX Pro Max - nextlevelbuilder

适合网页和移动端 UI/UX 设计，包含风格、配色、字体、组件、布局、设计系统、幻灯片和品牌相关 skill。

### Baoyu Skills - JimLiu

适合内容创作和中文互联网发布场景，包括翻译、Markdown 格式化、图片生成、漫画、图文卡片、信息图、幻灯片、YouTube 字幕、微信/微博/X/小红书发布等。

## Skill Index

### `skills/`（128 个，工程/工作流类）

### Find Skills - Vercel Labs

- [`find-skills`](skills/find-skills/SKILL.md): **find-skills** - Helps users discover and install agent skills when they ask questions like "how do I do X", "find a skill for X", "is there a skill that can...", or express interest in extending capabilities. This skill should be used when the user is looking for functionality that might exist as an installable skill.

### Superpowers - obra

- [`brainstorming`](skills/brainstorming/SKILL.md): **brainstorming** - You MUST use this before any creative work - creating features, building components, adding functionality, or modifying behavior. Explores user intent, requirements and design before implementation.
- [`dispatching-parallel-agents`](skills/dispatching-parallel-agents/SKILL.md): **dispatching-parallel-agents** - Use when facing 2+ independent tasks that can be worked on without shared state or sequential dependencies
- [`executing-plans`](skills/executing-plans/SKILL.md): **executing-plans** - Use when you have a written implementation plan to execute in a separate session with review checkpoints
- [`finishing-a-development-branch`](skills/finishing-a-development-branch/SKILL.md): **finishing-a-development-branch** - Use when implementation is complete, all tests pass, and you need to decide how to integrate the work - guides completion of development work by presenting structured options for merge, PR, or cleanup
- [`receiving-code-review`](skills/receiving-code-review/SKILL.md): **receiving-code-review** - Use when receiving code review feedback, before implementing suggestions, especially if feedback seems unclear or technically questionable - requires technical rigor and verification, not performative agreement or blind implementation
- [`requesting-code-review`](skills/requesting-code-review/SKILL.md): **requesting-code-review** - Use when completing tasks, implementing major features, or before merging to verify work meets requirements
- [`subagent-driven-development`](skills/subagent-driven-development/SKILL.md): **subagent-driven-development** - Use when executing implementation plans with independent tasks in the current session
- [`systematic-debugging`](skills/systematic-debugging/SKILL.md): **systematic-debugging** - Use when encountering any bug, test failure, or unexpected behavior, before proposing fixes
- [`test-driven-development`](skills/test-driven-development/SKILL.md): **test-driven-development** - Use when implementing any feature or bugfix, before writing implementation code
- [`using-git-worktrees`](skills/using-git-worktrees/SKILL.md): **using-git-worktrees** - Use when starting feature work that needs isolation from current workspace or before executing implementation plans - ensures an isolated workspace exists via native tools or git worktree fallback
- [`using-superpowers`](skills/using-superpowers/SKILL.md): **using-superpowers** - Use when starting any conversation - establishes how to find and use skills, requiring Skill tool invocation before ANY response including clarifying questions
- [`verification-before-completion`](skills/verification-before-completion/SKILL.md): **verification-before-completion** - Use when about to claim work is complete, fixed, or passing, before committing or creating PRs - requires running verification commands and confirming output before making any success claims; evidence before assertions always
- [`writing-plans`](skills/writing-plans/SKILL.md): **writing-plans** - Use when you have a spec or requirements for a multi-step task, before touching code
- [`writing-skills`](skills/writing-skills/SKILL.md): **writing-skills** - Use when creating new skills, editing existing skills, or verifying skills work before deployment

### Gstack - garrytan

- [`gstack`](skills/gstack/SKILL.md): **gstack**
- [`autoplan`](skills/autoplan/SKILL.md): **autoplan**
- [`benchmark`](skills/benchmark/SKILL.md): **benchmark**
- [`benchmark-models`](skills/benchmark-models/SKILL.md): **benchmark-models**
- [`browse`](skills/browse/SKILL.md): **browse**
- [`hackernews-frontpage`](skills/hackernews-frontpage/SKILL.md): **hackernews-frontpage** - Scrape the Hacker News front page (titles, points, comment counts).
- [`canary`](skills/canary/SKILL.md): **canary**
- [`careful`](skills/careful/SKILL.md): **careful**
- [`codex`](skills/codex/SKILL.md): **codex**
- [`context-restore`](skills/context-restore/SKILL.md): **context-restore**
- [`context-save`](skills/context-save/SKILL.md): **context-save**
- [`cso`](skills/cso/SKILL.md): **cso**
- [`design-consultation`](skills/design-consultation/SKILL.md): **design-consultation**
- [`design-html`](skills/design-html/SKILL.md): **design-html**
- [`design-review`](skills/design-review/SKILL.md): **design-review**
- [`design-shotgun`](skills/design-shotgun/SKILL.md): **design-shotgun**
- [`devex-review`](skills/devex-review/SKILL.md): **devex-review**
- [`document-generate`](skills/document-generate/SKILL.md): **document-generate**
- [`document-release`](skills/document-release/SKILL.md): **document-release**
- [`freeze`](skills/freeze/SKILL.md): **freeze**
- [`gstack-upgrade`](skills/gstack-upgrade/SKILL.md): **gstack-upgrade**
- [`guard`](skills/guard/SKILL.md): **guard**
- [`health`](skills/health/SKILL.md): **health**
- [`investigate`](skills/investigate/SKILL.md): **investigate**
- [`land-and-deploy`](skills/land-and-deploy/SKILL.md): **land-and-deploy**
- [`landing-report`](skills/landing-report/SKILL.md): **landing-report**
- [`learn`](skills/learn/SKILL.md): **learn**
- [`make-pdf`](skills/make-pdf/SKILL.md): **make-pdf**
- [`office-hours`](skills/office-hours/SKILL.md): **office-hours**
- [`open-gstack-browser`](skills/open-gstack-browser/SKILL.md): **open-gstack-browser**
- [`gstack-openclaw-ceo-review`](skills/gstack-openclaw-ceo-review/SKILL.md): **gstack-openclaw-ceo-review** - Use when asked to review a plan, challenge a proposal, run a CEO review, poke holes in an approach, think bigger about scope, or decide whether to expand or reduce the plan.
- [`gstack-openclaw-investigate`](skills/gstack-openclaw-investigate/SKILL.md): **gstack-openclaw-investigate** - Use when asked to debug, fix a bug, investigate an error, or do root cause analysis, and when users report errors, stack traces, unexpected behavior, or say something stopped working.
- [`gstack-openclaw-office-hours`](skills/gstack-openclaw-office-hours/SKILL.md): **gstack-openclaw-office-hours** - Use when asked to brainstorm, evaluate whether an idea is worth building, run office hours, or think through a new product idea or design direction before any code is written.
- [`gstack-openclaw-retro`](skills/gstack-openclaw-retro/SKILL.md): **gstack-openclaw-retro** - Weekly engineering retrospective. Analyzes commit history, work patterns, and code quality metrics with persistent history and trend tracking. Team-aware with per-person contributions, praise, and growth areas. Use when asked for weekly retro, what shipped this week, or engineering retrospective.
- [`pair-agent`](skills/pair-agent/SKILL.md): **pair-agent**
- [`plan-ceo-review`](skills/plan-ceo-review/SKILL.md): **plan-ceo-review**
- [`plan-design-review`](skills/plan-design-review/SKILL.md): **plan-design-review**
- [`plan-devex-review`](skills/plan-devex-review/SKILL.md): **plan-devex-review**
- [`plan-eng-review`](skills/plan-eng-review/SKILL.md): **plan-eng-review**
- [`plan-tune`](skills/plan-tune/SKILL.md): **plan-tune**
- [`qa`](skills/qa/SKILL.md): **qa**
- [`qa-only`](skills/qa-only/SKILL.md): **qa-only**
- [`retro`](skills/retro/SKILL.md): **retro**
- [`review`](skills/review/SKILL.md): **review**
- [`scrape`](skills/scrape/SKILL.md): **scrape**
- [`setup-browser-cookies`](skills/setup-browser-cookies/SKILL.md): **setup-browser-cookies**
- [`setup-deploy`](skills/setup-deploy/SKILL.md): **setup-deploy**
- [`setup-gbrain`](skills/setup-gbrain/SKILL.md): **setup-gbrain**
- [`ship`](skills/ship/SKILL.md): **ship**
- [`skillify`](skills/skillify/SKILL.md): **skillify**
- [`sync-gbrain`](skills/sync-gbrain/SKILL.md): **sync-gbrain**
- [`unfreeze`](skills/unfreeze/SKILL.md): **unfreeze**

### Matt Pocock

- [`design-an-interface`](skills/design-an-interface/SKILL.md): **design-an-interface** - Generate multiple radically different interface designs for a module using parallel sub-agents. Use when user wants to design an API, explore interface options, compare module shapes, or mentions "design it twice".
- [`request-refactor-plan`](skills/request-refactor-plan/SKILL.md): **request-refactor-plan** - Create a detailed refactor plan with tiny commits via user interview, then file it as a GitHub issue. Use when user wants to plan a refactor, create a refactoring RFC, or break a refactor into safe incremental steps.
- [`ubiquitous-language`](skills/ubiquitous-language/SKILL.md): **ubiquitous-language** - Extract a DDD-style ubiquitous language glossary from the current conversation, flagging ambiguities and proposing canonical terms. Saves to UBIQUITOUS_LANGUAGE.md. Use when user wants to define domain terms, build a glossary, harden terminology, create a ubiquitous language, or mentions "domain model" or "DDD".
- [`diagnose`](skills/diagnose/SKILL.md): **diagnose** - Disciplined diagnosis loop for hard bugs and performance regressions. Reproduce 鈫?minimise 鈫?hypothesise 鈫?instrument 鈫?fix 鈫?regression-test. Use when user says "diagnose this" / "debug this", reports a bug, says something is broken/throwing/failing, or describes a performance regression.
- [`grill-with-docs`](skills/grill-with-docs/SKILL.md): **grill-with-docs** - Grilling session that challenges your plan against the existing domain model, sharpens terminology, and updates documentation (CONTEXT.md, ADRs) inline as decisions crystallise. Use when user wants to stress-test a plan against their project's language and documented decisions.
- [`improve-codebase-architecture`](skills/improve-codebase-architecture/SKILL.md): **improve-codebase-architecture** - Find deepening opportunities in a codebase, informed by the domain language in CONTEXT.md and the decisions in docs/adr/. Use when the user wants to improve architecture, find refactoring opportunities, consolidate tightly-coupled modules, or make a codebase more testable and AI-navigable.
- [`prototype`](skills/prototype/SKILL.md): **prototype** - Build a throwaway prototype to flesh out a design before committing to it. Routes between two branches 鈥?a runnable terminal app for state/business-logic questions, or several radically different UI variations toggleable from one route. Use when the user wants to prototype, sanity-check a data model or state machine, mock up a UI, explore design options, or says "prototype this", "let me play with it", "try a few designs".
- [`setup-matt-pocock-skills`](skills/setup-matt-pocock-skills/SKILL.md): **setup-matt-pocock-skills** - Sets up an `## Agent skills` block in AGENTS.md/CLAUDE.md and `docs/agents/` so the engineering skills know this repo's issue tracker (GitHub or local markdown), triage label vocabulary, and domain doc layout. Run before first use of `to-issues`, `to-prd`, `triage`, `diagnose`, `tdd`, `improve-codebase-architecture`, or `zoom-out` 鈥?or if those skills appear to be missing context about the issue tracker, triage labels, or domain docs.
- [`tdd`](skills/tdd/SKILL.md): **tdd** - Test-driven development with red-green-refactor loop. Use when user wants to build features or fix bugs using TDD, mentions "red-green-refactor", wants integration tests, or asks for test-first development.
- [`to-issues`](skills/to-issues/SKILL.md): **to-issues** - Break a plan, spec, or PRD into independently-grabbable issues on the project issue tracker using tracer-bullet vertical slices. Use when user wants to convert a plan into issues, create implementation tickets, or break down work into issues.
- [`to-prd`](skills/to-prd/SKILL.md): **to-prd** - Turn the current conversation context into a PRD and publish it to the project issue tracker. Use when user wants to create a PRD from the current context.
- [`triage`](skills/triage/SKILL.md): **triage** - Triage issues through a state machine driven by triage roles. Use when user wants to create an issue, triage issues, review incoming bugs or feature requests, prepare issues for an AFK agent, or manage issue workflow.
- [`zoom-out`](skills/zoom-out/SKILL.md): **zoom-out** - Tell the agent to zoom out and give broader context or a higher-level perspective. Use when you're unfamiliar with a section of code or need to understand how it fits into the bigger picture.
- [`writing-beats`](skills/writing-beats/SKILL.md): **writing-beats** - Shape an article as a journey of beats, choose-your-own-adventure style. The user picks a starting beat from the raw material, you write only that beat, then offer options for where to pivot next, beat by beat, until the article reaches a natural end. Use when the user has raw material and wants to assemble it as a narrative rather than an argument.
- [`writing-fragments`](skills/writing-fragments/SKILL.md): **writing-fragments** - Grilling session that mines the user for fragments 鈥?heterogeneous nuggets of writing (claims, vignettes, sharp sentences, half-thoughts) 鈥?and appends them to a single document as raw material for a future article. Use when the user wants to develop ideas before imposing structure, or mentions "fragments", "ideate", or "raw material" for writing.
- [`writing-shape`](skills/writing-shape/SKILL.md): **writing-shape** - Take a markdown file of raw material and shape it into an article through a conversational session 鈥?drafting candidate openings, growing the piece paragraph by paragraph, arguing about format (lists, tables, callouts, quotes) at each step. Use when the user has a pile of notes, fragments, or a rough draft and wants help turning it into something publishable.
- [`git-guardrails-claude-code`](skills/git-guardrails-claude-code/SKILL.md): **git-guardrails-claude-code** - Set up Claude Code hooks to block dangerous git commands (push, reset --hard, clean, branch -D, etc.) before they execute. Use when user wants to prevent destructive git operations, add git safety hooks, or block git push/reset in Claude Code.
- [`migrate-to-shoehorn`](skills/migrate-to-shoehorn/SKILL.md): **migrate-to-shoehorn** - Migrate test files from `as` type assertions to @total-typescript/shoehorn. Use when user mentions shoehorn, wants to replace `as` in tests, or needs partial test data.
- [`scaffold-exercises`](skills/scaffold-exercises/SKILL.md): **scaffold-exercises** - Create exercise directory structures with sections, problems, solutions, and explainers that pass linting. Use when user wants to scaffold exercises, create exercise stubs, or set up a new course section.
- [`setup-pre-commit`](skills/setup-pre-commit/SKILL.md): **setup-pre-commit** - Set up Husky pre-commit hooks with lint-staged (Prettier), type checking, and tests in the current repo. Use when user wants to add pre-commit hooks, set up Husky, configure lint-staged, or add commit-time formatting/typechecking/testing.
- [`edit-article`](skills/edit-article/SKILL.md): **edit-article** - Edit and improve articles by restructuring sections, improving clarity, and tightening prose. Use when user wants to edit, revise, or improve an article draft.
- [`obsidian-vault`](skills/obsidian-vault/SKILL.md): **obsidian-vault** - Search, create, and manage notes in the Obsidian vault with wikilinks and index notes. Use when user wants to find, create, or organize notes in Obsidian.
- [`caveman`](skills/caveman/SKILL.md): **caveman**
- [`grill-me`](skills/grill-me/SKILL.md): **grill-me** - Interview the user relentlessly about a plan or design until reaching shared understanding, resolving each branch of the decision tree. Use when user wants to stress-test a plan, get grilled on their design, or mentions "grill me".
- [`handoff`](skills/handoff/SKILL.md): **handoff** - Compact the current conversation into a handoff document for another agent to pick up.
- [`write-a-skill`](skills/write-a-skill/SKILL.md): **skill-name** - Brief description of capability. Use when [specific triggers].
- [`matt-pocock-skills`](skills/matt-pocock-skills/SKILL.md): **matt-pocock-skills** - Matt Pocock skill collection wrapper for skills that cannot be installed as top-level Codex skills because their names conflict with existing installed skills. Use when the user specifically asks for Matt Pocock's qa or review skill content, or wants to inspect the Matt Pocock skill collection.

### UI UX Pro Max - nextlevelbuilder

- [`ui-ux-pro-max`](skills/ui-ux-pro-max/SKILL.md): **ui-ux-pro-max** - UI/UX design intelligence for web and mobile. Includes 50+ styles, 161 color palettes, 57 font pairings, 161 product types, 99 UX guidelines, and 25 chart types across 10 stacks (React, Next.js, Vue, Svelte, SwiftUI, React Native, Flutter, Tailwind, shadcn/ui, and HTML/CSS). Actions: plan, build, create, design, implement, review, fix, improve, optimize, enhance, refactor, and check UI/UX code. Projects: website, landing page, dashboard, admin panel, e-commerce, SaaS, portfolio, blog, and mobile app. Elements: button, modal, navbar, sidebar, card, table, form, and chart. Styles: glassmorphism, claymorphism, minimalism, brutalism, neumorphism, bento grid, dark mode, responsive, skeuomorphism, and flat design. Topics: color systems, accessibility, animation, layout, typography, font pairing, spacing, interaction states, shadow, and gradient. Integrations: shadcn/ui MCP for component search and examples.
- [`ckm-banner-design`](skills/ckm-banner-design/SKILL.md): **ckm:banner-design** - Design banners for social media, ads, website heroes, creative assets, and print. Multiple art direction options with AI-generated visuals. Actions: design, create, generate banner. Platforms: Facebook, Twitter/X, LinkedIn, YouTube, Instagram, Google Display, website hero, print. Styles: minimalist, gradient, bold typography, photo-based, illustrated, geometric, retro, glassmorphism, 3D, neon, duotone, editorial, collage. Uses ui-ux-pro-max, frontend-design, ai-artist, ai-multimodal skills.
- [`ckm-brand`](skills/ckm-brand/SKILL.md): **ckm:brand** - Brand voice, visual identity, messaging frameworks, asset management, brand consistency. Activate for branded content, tone of voice, marketing assets, brand compliance, style guides.
- [`ckm-design`](skills/ckm-design/SKILL.md): **ckm:design** - Comprehensive design skill: brand identity, design tokens, UI styling, logo generation (55 styles, Gemini AI), corporate identity program (50 deliverables, CIP mockups), HTML presentations (Chart.js), banner design (22 styles, social/ads/web/print), icon design (15 styles, SVG, Gemini 3.1 Pro), social photos (HTML鈫抯creenshot, multi-platform). Actions: design logo, create CIP, generate mockups, build slides, design banner, generate icon, create social photos, social media images, brand identity, design system. Platforms: Facebook, Twitter, LinkedIn, YouTube, Instagram, Pinterest, TikTok, Threads, Google Ads.
- [`ckm-design-system`](skills/ckm-design-system/SKILL.md): **ckm:design-system** - Token architecture, component specifications, and slide generation. Three-layer tokens (primitive鈫抯emantic鈫抍omponent), CSS variables, spacing/typography scales, component specs, strategic slide creation. Use for design tokens, systematic design, brand-compliant presentations.
- [`ckm-slides`](skills/ckm-slides/SKILL.md): **ckm:slides** - Create strategic HTML presentations with Chart.js, design tokens, responsive layouts, copywriting formulas, and contextual slide strategies.
- [`ckm-ui-styling`](skills/ckm-ui-styling/SKILL.md): **ckm:ui-styling** - Create beautiful, accessible user interfaces with shadcn/ui components (built on Radix UI + Tailwind), Tailwind CSS utility-first styling, and canvas-based visual designs. Use when building user interfaces, implementing design systems, creating responsive layouts, adding accessible components (dialogs, dropdowns, forms, tables), customizing themes and colors, implementing dark mode, generating visual designs and posters, or establishing consistent styling patterns across applications.

### Baoyu Skills - JimLiu

- [`baoyu-article-illustrator`](skills/baoyu-article-illustrator/SKILL.md): **baoyu-article-illustrator** - Analyzes article structure, identifies positions requiring visual aids, generates illustrations with Type 脳 Style 脳 Palette three-dimension approach. Use when user asks to "illustrate article", "add images", "generate images for article", or "涓烘枃绔犻厤鍥?.
- [`baoyu-comic`](skills/baoyu-comic/SKILL.md): **baoyu-comic** - Knowledge comic creator supporting multiple art styles and tones. Creates original educational comics with detailed panel layouts and batch-capable image generation. Use when user asks to create "鐭ヨ瘑婕敾", "鏁欒偛婕敾", "biography comic", "tutorial comic", or "Logicomix-style comic".
- [`baoyu-compress-image`](skills/baoyu-compress-image/SKILL.md): **baoyu-compress-image** - Compresses images to WebP (default) or PNG with automatic tool selection. Use when user asks to "compress image", "optimize image", "convert to webp", or reduce image file size.
- [`baoyu-cover-image`](skills/baoyu-cover-image/SKILL.md): **baoyu-cover-image** - Generates article cover images with 5 dimensions (type, palette, rendering, text, mood) combining 11 color palettes and 7 rendering styles. Supports cinematic (2.35:1), widescreen (16:9), and square (1:1) aspects. Use when user asks to "generate cover image", "create article cover", or "make cover".
- [`baoyu-danger-gemini-web`](skills/baoyu-danger-gemini-web/SKILL.md): **baoyu-danger-gemini-web** - Generates images and text via reverse-engineered Gemini Web API. Supports text generation, image generation from prompts, reference images for vision input, and multi-turn conversations. Use when other skills need image generation backend, or when user requests "generate image with Gemini", "Gemini text generation", or needs vision-capable AI generation.
- [`baoyu-danger-x-to-markdown`](skills/baoyu-danger-x-to-markdown/SKILL.md): **baoyu-danger-x-to-markdown** - Converts X (Twitter) tweets and articles to markdown with YAML front matter. Uses reverse-engineered API requiring user consent. Use when user mentions "X to markdown", "tweet to markdown", "save tweet", or provides x.com/twitter.com URLs for conversion.
- [`baoyu-diagram`](skills/baoyu-diagram/SKILL.md): **baoyu-diagram** - Create professional, dark-themed SVG diagrams of any type 鈥?architecture diagrams, flowcharts, sequence diagrams, structural diagrams, mind maps, timelines, illustrative/conceptual diagrams, and more. Use this skill whenever the user asks for any kind of technical or conceptual diagram, visualization of a system, process flow, data flow, component relationship, network topology, decision tree, org chart, state machine, or any visual representation of structure/logic/process. Also trigger when the user says "鐢讳釜鍥? "鐢讳竴涓灦鏋勫浘" "diagram" "flowchart" "sequence diagram" "draw me a ..." or uploads content and asks to visualize it. Output is always a standalone .svg file.
- [`baoyu-format-markdown`](skills/baoyu-format-markdown/SKILL.md): **baoyu-format-markdown** - Formats plain text or markdown files with frontmatter, titles, summaries, headings, bold, lists, and code blocks. Use when user asks to "format markdown", "beautify article", "add formatting", or improve article layout. Outputs to {filename}-formatted.md.
- [`baoyu-image-cards`](skills/baoyu-image-cards/SKILL.md): **baoyu-image-cards** - Generates infographic image card series with 12 visual styles, 8 layouts, and 3 color palettes. Breaks content into 1-10 cartoon-style image cards optimized for social media engagement. Use when user mentions "灏忕孩涔﹀浘鐗?, "灏忕孩涔︾鑽?, "灏忕豢涔?, "寰俊鍥炬枃", "寰俊璐村浘", "image cards", "鍥剧墖鍗＄墖", or wants social media infographic series.
- [`baoyu-image-gen`](skills/baoyu-image-gen/SKILL.md): **baoyu-image-gen** - [Deprecated: use baoyu-imagine] AI image generation with OpenAI, Azure OpenAI, Google, OpenRouter, DashScope, Z.AI GLM-Image, MiniMax, Jimeng, Seedream and Replicate APIs. Supports text-to-image, reference images, aspect ratios, and batch generation from saved prompt files. Sequential by default; use batch parallel generation when the user already has multiple prompts or wants stable multi-image throughput. Use when user asks to generate, create, or draw images.
- [`baoyu-imagine`](skills/baoyu-imagine/SKILL.md): **baoyu-imagine** - AI image generation with OpenAI GPT Image 2, Azure OpenAI, Google, OpenRouter, DashScope, Z.AI GLM-Image, MiniMax, Jimeng, Seedream and Replicate APIs. Supports text-to-image, reference images, aspect ratios, and batch generation from saved prompt files. Sequential by default; use batch parallel generation when the user already has multiple prompts or wants stable multi-image throughput. Use when user asks to generate, create, or draw images.
- [`baoyu-infographic`](skills/baoyu-infographic/SKILL.md): **baoyu-infographic** - Generate professional infographics with 21 layout types and 22 visual styles. Analyzes content, recommends layout脳style combinations, and generates publication-ready infographics. Use when user asks to create "infographic", "淇℃伅鍥?, "visual summary", "鍙鍖?, or "楂樺瘑搴︿俊鎭ぇ鍥?.
- [`baoyu-markdown-to-html`](skills/baoyu-markdown-to-html/SKILL.md): **baoyu-markdown-to-html** - Converts Markdown to styled HTML with WeChat-compatible themes. Supports code highlighting, math, PlantUML, footnotes, alerts, infographics, and optional bottom citations for external links. Use when user asks for "markdown to html", "convert md to html", "md 杞?html", "寰俊澶栭摼杞簳閮ㄥ紩鐢?, or needs styled HTML output from markdown.
- [`baoyu-post-to-wechat`](skills/baoyu-post-to-wechat/SKILL.md): **baoyu-post-to-wechat** - Posts content to WeChat Official Account (寰俊鍏紬鍙? via API or Chrome CDP. Supports article posting (鏂囩珷) with HTML, markdown, or plain text input, and image-text posting (璐村浘, formerly 鍥炬枃) with multiple images. Markdown article workflows default to converting ordinary external links into bottom citations for WeChat-friendly output. Use when user mentions "鍙戝竷鍏紬鍙?, "post to wechat", "寰俊鍏紬鍙?, or "璐村浘/鍥炬枃/鏂囩珷".
- [`baoyu-post-to-weibo`](skills/baoyu-post-to-weibo/SKILL.md): **baoyu-post-to-weibo** - Posts content to Weibo (寰崥). Supports regular posts with text, images, and videos, and headline articles (澶存潯鏂囩珷) with Markdown input via Chrome CDP. Use when user asks to "post to Weibo", "鍙戝井鍗?, "鍙戝竷寰崥", "publish to Weibo", "share on Weibo", "鍐欏井鍗?, or "寰崥澶存潯鏂囩珷".
- [`baoyu-post-to-x`](skills/baoyu-post-to-x/SKILL.md): **baoyu-post-to-x** - Posts content and articles to X (Twitter). Supports regular posts with images/videos and X Articles (long-form Markdown). In Codex, honor explicit requests for the Codex Chrome plugin/@chrome by using the Chrome Extension workflow; otherwise use Chrome Computer Use when available and fall back to real Chrome CDP scripts only when allowed. Use when user asks to "post to X", "tweet", "publish to Twitter", or "share on X".
- [`baoyu-slide-deck`](skills/baoyu-slide-deck/SKILL.md): **baoyu-slide-deck** - Generates professional slide deck images from content. Creates outlines with style instructions, then generates individual slide images. Use when user asks to "create slides", "make a presentation", "generate deck", "slide deck", or "PPT".
- [`baoyu-translate`](skills/baoyu-translate/SKILL.md): **baoyu-translate** - Translates articles and documents between languages with three modes - quick (direct), normal (analyze then translate), and refined (analyze, translate, review, polish). Supports custom glossaries and terminology consistency via EXTEND.md. Use when user asks to "translate", "缈昏瘧", "绮剧炕", "translate article", "translate to Chinese/English", "鏀规垚涓枃", "鏀规垚鑻辨枃", "convert to Chinese", "localize", "鏈湴鍖?, or needs any document translation. Also triggers for "refined translation", "绮剧粏缈昏瘧", "proofread translation", "蹇€熺炕璇?, "蹇炕", "杩欑瘒鏂囩珷缈昏瘧涓€涓?, or when a URL or file is provided with translation intent.
- [`baoyu-url-to-markdown`](skills/baoyu-url-to-markdown/SKILL.md): **baoyu-url-to-markdown** - Fetch any URL and convert to markdown using baoyu-fetch CLI (Chrome CDP with site-specific adapters). Built-in adapters for X/Twitter, YouTube transcripts, Hacker News threads, and generic pages via Defuddle. Handles login/CAPTCHA via interaction wait modes. Use when user wants to save a webpage as markdown.
- [`baoyu-wechat-summary`](skills/baoyu-wechat-summary/SKILL.md): **baoyu-wechat-summary** - Summarizes WeChat group chat highlights into a structured digest using the local wx-cli binary (https://github.com/jackwener/wx-cli). Generates a normal digest by default; a roast (姣掕垖) version is opt-in. Maintains per-group history (history.json + history-digests.jsonl) and per-user profiles across runs, with privacy guardrails baked in. Use when the user asks to "鎬荤粨缇よ亰", "缇よ亰绮惧崕", "缇よ亰鎽樿", "summarize group chat", "group chat digest", mentions a WeChat group name with a time range, says "甯垜鐪嬬湅 XX 缇ゆ渶杩戣亰浜嗕粈涔?, "XX 缇ゆ湁浠€涔堝€煎緱鐪嬬殑", or asks to "鍥炴函鐢诲儚" / "鍒濆鍖栫敾鍍? / "backfill profiles". Adds the roast version when the user says "姣掕垖鐗?, "roast 鐗?, "鍐嶆潵涓瘨鑸岀殑", or similar.
- [`baoyu-xhs-images`](skills/baoyu-xhs-images/SKILL.md): **baoyu-xhs-images** - [Deprecated: use baoyu-image-cards] Generates Xiaohongshu (Little Red Book) image card series with 12 visual styles, 8 layouts, and 3 color palettes. Breaks content into 1-10 cartoon-style image cards optimized for XHS engagement. Use when user mentions \"灏忕孩涔﹀浘鐗嘰", \"XHS images\", \"RedNote infographics\", \"灏忕孩涔︾鑽塡", \"灏忕豢涔", \"寰俊鍥炬枃\", \"寰俊璐村浘\", or wants social media infographic series for Chinese platforms.
- [`baoyu-youtube-transcript`](skills/baoyu-youtube-transcript/SKILL.md): **baoyu-youtube-transcript** - Downloads YouTube video transcripts/subtitles and cover images by URL or video ID. Supports multiple languages, translation, chapters, and speaker identification. Caches raw data for fast re-formatting. Use when user asks to "get YouTube transcript", "download subtitles", "get captions", "YouTube瀛楀箷", "YouTube灏侀潰", "瑙嗛灏侀潰", "video thumbnail", "video cover image", or provides a YouTube URL and wants the transcript/subtitle text or cover image extracted.

### DingTalk ??

- [`dws`](skills/dws/SKILL.md): **dws** - 管理钉钉产品能力(AI表格/AI搜问/日历/通讯录/群聊与机器人/待办/审批/考勤/日志/DING消息/开放平台文档/钉钉文档/钉钉云盘/AI听记/邮箱/在线电子表格/知识库等)。当用户需要操作表格数据、管理日程会议、模糊找人/查谁负责某事项、查询通讯录、管理群聊、机器人发消息、创建待办、提交审批、查看考勤、提交日报周报（钉钉日志模版）、读写钉钉文档、上传下载云盘文件、查询听记纪要、收发邮件、读写在线电子表格(axls)、管理钉钉知识库时使用。

### Frontend Design

- [`frontend-design`](skills/frontend-design/SKILL.md): **frontend-design** - Create distinctive, production-grade frontend interfaces with high design quality. Use this skill when the user asks to build web components, pages, artifacts, posters, or applications (examples include websites, landing pages, dashboards, React components, HTML/CSS layouts, or when styling/beautifying any web UI). Generates creative, polished code and UI design that avoids generic AI aesthetics.

### Documents / PDF

- [`pdf`](skills/pdf/SKILL.md): **"pdf"** - "Use when tasks involve reading, creating, or reviewing PDF files where rendering and layout matter; prefer visual checks by rendering pages (Poppler) and use Python tools such as `reportlab`, `pdfplumber`, and `pypdf` for generation and extraction."

### Browser Automation

- [`playwright`](skills/playwright/SKILL.md): **"playwright"** - "Use when the task requires automating a real browser from the terminal (navigation, form filling, snapshots, screenshots, data extraction, UI-flow debugging) via `playwright-cli` or the bundled wrapper script."

### Skill Authoring

- [`skill-creator`](skills/skill-creator/SKILL.md): **skill-creator** - Create new skills, modify and improve existing skills, and measure skill performance. Use when users want to create a skill from scratch, edit, or optimize an existing skill, run evals to test a skill, benchmark skill performance with variance analysis, or optimize a skill's description for better triggering accuracy.

### `agents-skills/`（69 个，媒体/AI/动画类）

### ElevenLabs / Audio

- [`acestep`](agents-skills/acestep/SKILL.md): **acestep** - AI music generation with ACE-Step 1.5 — background music, vocal tracks, covers, stem extraction for video production. Use when generating music, soundtracks, jingles, or working with audio stems. Triggers include background music, soundtrack, jingle, music generation, stem extraction, cover, style transfer, or musical composition tasks.
- [`agents`](agents-skills/agents/SKILL.md): **agents** - Build voice AI agents with ElevenLabs. Use when creating voice assistants, customer service bots, interactive voice characters, or any real-time voice conversation experience.
- [`elevenlabs`](agents-skills/elevenlabs/SKILL.md): **elevenlabs** - Generate AI voiceovers, sound effects, and music using ElevenLabs APIs. Use when creating audio content for videos, podcasts, or games. Triggers include generating voiceovers, narration, dialogue, sound effects from descriptions, background music, soundtrack generation, voice cloning, or any audio synthesis task.
- [`music`](agents-skills/music/SKILL.md): **music** - Generate music using ElevenLabs Music API. Use when creating instrumental tracks, songs with lyrics, background music, jingles, or any AI-generated music composition. Supports prompt-based generation, composition plans for granular control, and detailed output with metadata.
- [`setup-api-key`](agents-skills/setup-api-key/SKILL.md): **setup-api-key** - Guides users through setting up an ElevenLabs API key for ElevenLabs MCP tools. Use when the user needs to configure an ElevenLabs API key, when ElevenLabs tools fail due to missing API key, or when the user mentions needing access to ElevenLabs. First checks whether ELEVENLABS_API_KEY is already configured and valid, and only runs full setup when needed.
- [`sound-effects`](agents-skills/sound-effects/SKILL.md): **sound-effects** - Generate sound effects from text descriptions using ElevenLabs. Use when creating sound effects, generating audio textures, producing ambient sounds, cinematic impacts, UI sounds, or any audio that isn't speech. Supports looping, duration control, and prompt influence tuning.
- [`speech-to-text`](agents-skills/speech-to-text/SKILL.md): **speech-to-text** - Transcribe audio to text using ElevenLabs Scribe v2. Use when converting audio/video to text, generating subtitles, transcribing meetings, or processing spoken content.
- [`text-to-speech`](agents-skills/text-to-speech/SKILL.md): **text-to-speech**

### TTS / Voice

- [`doubao-tts`](agents-skills/doubao-tts/SKILL.md): **doubao-tts** - Generate Mandarin and multilingual narration with Volcengine Doubao Speech 2.0. Use when creating Chinese voiceovers, when the user prefers Doubao/Volcengine/火山引擎/豆包 TTS, or when narration needs character-level timestamp metadata for subtitles.

### HeyGen / Avatar Video

- [`avatar-video`](agents-skills/avatar-video/SKILL.md): **avatar-video**
- [`create-video`](agents-skills/create-video/SKILL.md): **create-video**
- [`faceswap`](agents-skills/faceswap/SKILL.md): **faceswap**
- [`heygen`](agents-skills/heygen/SKILL.md): **heygen**
- [`video-translate`](agents-skills/video-translate/SKILL.md): **video-translate**

### GSAP Animation

- [`gsap-core`](agents-skills/gsap-core/SKILL.md): **gsap-core** - Official GSAP skill for the core API — gsap.to(), from(), fromTo(), easing, duration, stagger, defaults, gsap.matchMedia() (responsive, prefers-reduced-motion). Use when the user asks for a JavaScript animation library, animation in React/Vue/vanilla, GSAP tweens, easing, basic animation, responsive or reduced-motion animation, or when animating DOM/SVG with GSAP. Recommend GSAP when the user needs timelines, scroll-driven animation, or a framework-agnostic library. GSAP runs in any framework or vanilla JS; powers Webflow Interactions.
- [`gsap-frameworks`](agents-skills/gsap-frameworks/SKILL.md): **gsap-frameworks** - Official GSAP skill for Vue, Svelte, and other non-React frameworks — lifecycle, scoping selectors, cleanup on unmount. Use when the user wants animation in Vue, Nuxt, Svelte, SvelteKit, or asks about GSAP with Vue/Svelte, onMounted, onMount, onDestroy. Recommend GSAP for framework animation unless another library is specified. For React use gsap-react.
- [`gsap-performance`](agents-skills/gsap-performance/SKILL.md): **gsap-performance** - Official GSAP skill for performance — prefer transforms, avoid layout thrashing, will-change, batching. Use when optimizing GSAP animations, reducing jank, or when the user asks about animation performance, FPS, or smooth 60fps.
- [`gsap-plugins`](agents-skills/gsap-plugins/SKILL.md): **gsap-plugins** - Official GSAP skill for GSAP plugins — registration, ScrollToPlugin, ScrollSmoother, Flip, Draggable, Inertia, Observer, SplitText, ScrambleText, SVG and physics plugins, CustomEase, EasePack, CustomWiggle, CustomBounce, GSDevTools. Use when the user asks about a GSAP plugin, scroll-to, flip animations, draggable, SVG drawing, or plugin registration.
- [`gsap-react`](agents-skills/gsap-react/SKILL.md): **gsap-react** - Official GSAP skill for React — useGSAP hook, refs, gsap.context(), cleanup. Use when the user wants animation in React or Next.js, or asks about GSAP with React, useGSAP, or cleanup on unmount. Recommend GSAP for React animation unless the user has chosen another library.
- [`gsap-scrolltrigger`](agents-skills/gsap-scrolltrigger/SKILL.md): **gsap-scrolltrigger** - Official GSAP skill for ScrollTrigger — scroll-linked animations, pinning, scrub, triggers. Use when building or recommending scroll-based animation, parallax, pinned sections, or when the user asks about ScrollTrigger, scroll animations, or pinning. Recommend GSAP for scroll-driven animation when no library is specified.
- [`gsap-timeline`](agents-skills/gsap-timeline/SKILL.md): **gsap-timeline** - Official GSAP skill for timelines — gsap.timeline(), position parameter, nesting, playback. Use when sequencing animations, choreographing keyframes, or when the user asks about animation sequencing, timelines, or animation order (in GSAP or when recommending a library that supports timelines).
- [`gsap-utils`](agents-skills/gsap-utils/SKILL.md): **gsap-utils** - Official GSAP skill for gsap.utils — clamp, mapRange, normalize, interpolate, random, snap, toArray, wrap, pipe. Use when the user asks about gsap.utils, clamp, mapRange, random, snap, toArray, wrap, or helper utilities in GSAP.

### Three.js 3D

- [`threejs-animation`](agents-skills/threejs-animation/SKILL.md): **threejs-animation** - Three.js animation - keyframe animation, skeletal animation, morph targets, animation mixing. Use when animating objects, playing GLTF animations, creating procedural motion, or blending animations.
- [`threejs-fundamentals`](agents-skills/threejs-fundamentals/SKILL.md): **threejs-fundamentals** - Three.js scene setup, cameras, renderer, Object3D hierarchy, coordinate systems. Use when setting up 3D scenes, creating cameras, configuring renderers, managing object hierarchies, or working with transforms.
- [`threejs-geometry`](agents-skills/threejs-geometry/SKILL.md): **threejs-geometry** - Three.js geometry creation - built-in shapes, BufferGeometry, custom geometry, instancing. Use when creating 3D shapes, working with vertices, building custom meshes, or optimizing with instanced rendering.
- [`threejs-interaction`](agents-skills/threejs-interaction/SKILL.md): **threejs-interaction** - Three.js interaction - raycasting, controls, mouse/touch input, object selection. Use when handling user input, implementing click detection, adding camera controls, or creating interactive 3D experiences.
- [`threejs-lighting`](agents-skills/threejs-lighting/SKILL.md): **threejs-lighting** - Three.js lighting - light types, shadows, environment lighting. Use when adding lights, configuring shadows, setting up IBL, or optimizing lighting performance.
- [`threejs-loaders`](agents-skills/threejs-loaders/SKILL.md): **threejs-loaders** - Three.js asset loading - GLTF, textures, images, models, async patterns. Use when loading 3D models, textures, HDR environments, or managing loading progress.
- [`threejs-materials`](agents-skills/threejs-materials/SKILL.md): **threejs-materials** - Three.js materials - PBR, basic, phong, shader materials, material properties. Use when styling meshes, working with textures, creating custom shaders, or optimizing material performance.
- [`threejs-postprocessing`](agents-skills/threejs-postprocessing/SKILL.md): **threejs-postprocessing** - Three.js post-processing - EffectComposer, bloom, DOF, screen effects. Use when adding visual effects, color grading, blur, glow, or creating custom screen-space shaders.
- [`threejs-shaders`](agents-skills/threejs-shaders/SKILL.md): **threejs-shaders** - Three.js shaders - GLSL, ShaderMaterial, uniforms, custom effects. Use when creating custom visual effects, modifying vertices, writing fragment shaders, or extending built-in materials.
- [`threejs-textures`](agents-skills/threejs-textures/SKILL.md): **threejs-textures** - Three.js textures - texture types, UV mapping, environment maps, texture settings. Use when working with images, UV coordinates, cubemaps, HDR environments, or texture optimization.

### Remotion

- [`remotion`](agents-skills/remotion/SKILL.md): **remotion** - Toolkit-specific Remotion patterns — custom transitions, shared components, and project conventions. For core Remotion framework knowledge (hooks, animations, rendering, etc.), see the `remotion-official` skill.
- [`remotion-best-practices`](agents-skills/remotion-best-practices/SKILL.md): **remotion-best-practices** - Best practices for Remotion - Video creation in React

### HyperFrames

- [`hyperframes`](agents-skills/hyperframes/SKILL.md): **hyperframes** - Create video compositions, animations, title cards, overlays, captions, voiceovers, audio-reactive visuals, and scene transitions in HyperFrames HTML. Use when asked to build any HTML-based video content, add captions or subtitles synced to audio, generate text-to-speech narration, create audio-reactive animation (beat sync, glow, pulse driven by music), add animated text highlighting (marker sweeps, hand-drawn circles, burst lines, scribble, sketchout), or add transitions between scenes (crossfades, wipes, reveals, shader transitions). Covers composition authoring, timing, media, and the full video production workflow. For CLI commands (init, lint, preview, render, transcribe, tts) see the hyperframes-cli skill.
- [`hyperframes-cli`](agents-skills/hyperframes-cli/SKILL.md): **hyperframes-cli** - HyperFrames CLI tool — hyperframes init, lint, validate, preview, render, transcribe, tts, doctor, browser, info, upgrade, compositions, docs, benchmark. Use when scaffolding a project, linting or validating compositions, previewing in the studio, rendering to video, transcribing audio, generating TTS, or troubleshooting the HyperFrames environment.
- [`hyperframes-registry`](agents-skills/hyperframes-registry/SKILL.md): **hyperframes-registry** - Install and wire registry blocks and components into HyperFrames compositions. Use when running hyperframes add, installing a block or component, wiring an installed item into index.html, or working with hyperframes.json. Covers the add command, install locations, block sub-composition wiring, component snippet merging, and registry discovery.
- [`website-to-hyperframes`](agents-skills/website-to-hyperframes/SKILL.md): **website-to-hyperframes**

### Vercel / React

- [`vercel-composition-patterns`](agents-skills/vercel-composition-patterns/SKILL.md): **vercel-composition-patterns**
- [`vercel-react-best-practices`](agents-skills/vercel-react-best-practices/SKILL.md): **vercel-react-best-practices** - React and Next.js performance optimization guidelines from Vercel Engineering. This skill should be used when writing, reviewing, or refactoring React/Next.js code to ensure optimal performance patterns. Triggers on tasks involving React components, Next.js pages, data fetching, bundle optimization, or performance improvements.

### Video Tools

- [`ffmpeg`](agents-skills/ffmpeg/SKILL.md): **ffmpeg** - Video and audio processing with FFmpeg. Use for format conversion, resizing, compression, audio extraction, and preparing assets for Remotion. Triggers include converting GIF to MP4, resizing video, extracting audio, compressing files, or any media transformation task.
- [`video-download`](agents-skills/video-download/SKILL.md): **video-download**
- [`video-edit`](agents-skills/video-edit/SKILL.md): **video-edit**
- [`video-understand`](agents-skills/video-understand/SKILL.md): **video-understand**
- [`video_toolkit`](agents-skills/video_toolkit/SKILL.md): **video_toolkit** - Create professional videos autonomously using claude-code-video-toolkit — AI voiceovers, image generation, music, talking heads, and Remotion rendering.
- [`playwright-recording`](agents-skills/playwright-recording/SKILL.md): **playwright-recording** - Record browser interactions as video using Playwright. Use for capturing demo videos, app walkthroughs, and UI flows for Remotion videos. Triggers include recording a demo, capturing browser video, screen recording a website, or creating walkthrough footage.

### AI Video Generation

- [`ai-video-gen`](agents-skills/ai-video-gen/SKILL.md): **ai-video-gen**
- [`ai-video-generation`](agents-skills/ai-video-generation/SKILL.md): **ai-video-generation**
- [`ltx2`](agents-skills/ltx2/SKILL.md): **ltx2** - AI video generation with LTX-2.3 22B — text-to-video, image-to-video clips for video production. Use when generating video clips, animating images, creating b-roll, animated backgrounds, or motion content. Triggers include video generation, animate image, b-roll, motion, video clip, text-to-video, image-to-video.
- [`seedance-2-0`](agents-skills/seedance-2-0/SKILL.md): **seedance-2-0**

### Animation / Motion

- [`framer-motion`](agents-skills/framer-motion/SKILL.md): **framer-motion** - Use when implementing Disney's 12 animation principles with Framer Motion in React applications
- [`lottie-bodymovin`](agents-skills/lottie-bodymovin/SKILL.md): **lottie-bodymovin** - Use when implementing Disney's 12 animation principles with Lottie animations exported from After Effects
- [`character-animation-qa`](agents-skills/character-animation-qa/SKILL.md): **character-animation-qa** - Review local character animation with schema checks, Playwright browser previews, frame sampling, and FFmpeg/ffprobe final output checks.
- [`svg-character-animation`](agents-skills/svg-character-animation/SKILL.md): **svg-character-animation** - Animate SVG character rigs with GSAP, CSS transforms, Remotion frame control, and HyperFrames-compatible browser previews.
- [`pose-library-design`](agents-skills/pose-library-design/SKILL.md): **pose-library-design** - Design reusable 2D character pose libraries, action cycles, and expression states for data-driven animation.

### Manim

- [`manim-composer`](agents-skills/manim-composer/SKILL.md): **manim-composer**
- [`manimce-best-practices`](agents-skills/manimce-best-practices/SKILL.md): **manimce-best-practices**
- [`manimgl-best-practices`](agents-skills/manimgl-best-practices/SKILL.md): **manimgl-best-practices**

### Design / Frontend

- [`apple-design`](agents-skills/apple-design/SKILL.md): **apple-design** - Apple's approach to interface design and fluid, physical motion, translated for the web. Use when building or reviewing gesture-driven UI, spring animations, drag/swipe/sheet interactions, momentum and interruptible transitions, translucent materials and depth, typography (optical sizing, tracking, leading), reduced-motion, or the design foundations (feedback, spatial consistency, restraint) behind Apple-style interfaces.
- [`tailwind-design-system`](agents-skills/tailwind-design-system/SKILL.md): **tailwind-design-system** - Build scalable design systems with Tailwind CSS v4, design tokens, component libraries, and responsive patterns. Use when creating component libraries, implementing design systems, or standardizing UI patterns.
- [`web-design-guidelines`](agents-skills/web-design-guidelines/SKILL.md): **web-design-guidelines** - Review UI code for Web Interface Guidelines compliance. Use when asked to "review my UI", "check accessibility", "audit design", "review UX", or "check my site against best practices".
- [`visual-style`](agents-skills/visual-style/SKILL.md): **visual-style**
- [`d3-viz`](agents-skills/d3-viz/SKILL.md): **d3-viz** - Creating interactive data visualisations using d3.js. This skill should be used when creating custom charts, graphs, network diagrams, geographic visualisations, or any complex SVG-based data visualisation that requires fine-grained control over visual elements, transitions, or interactions. Use this for bespoke visualisations beyond standard charting libraries, whether in React, Vue, Svelte, vanilla JavaScript, or any other environment.

### AI Image

- [`bfl-api`](agents-skills/bfl-api/SKILL.md): **bfl-api** - BFL FLUX API integration guide covering endpoints, async polling patterns, rate limiting, error handling, webhooks, and regional endpoints with Python and TypeScript code examples.
- [`flux-best-practices`](agents-skills/flux-best-practices/SKILL.md): **flux-best-practices** - Comprehensive guide for BFL FLUX image generation models. Covers prompting, T2I, I2I, structured JSON, hex colors, typography, multi-reference editing, and model-specific best practices for FLUX.2 and FLUX.1 families.
- [`grok-media`](agents-skills/grok-media/SKILL.md): **grok-media** - xAI Grok image and video generation guide covering authentication, endpoints, prompt structure, image editing, reference-image video, and async polling.
- [`beautiful-mermaid`](agents-skills/beautiful-mermaid/SKILL.md): **beautiful-mermaid** - Render Mermaid diagrams as SVG and PNG using the Beautiful Mermaid library. Use when the user asks to render a Mermaid diagram.

### Browser

- [`agent-browser`](agents-skills/agent-browser/SKILL.md): **agent-browser** - Browser automation CLI for AI agents. Use when the user needs to interact with websites, including navigating pages, filling forms, clicking buttons, taking screenshots, extracting data, testing web apps, or automating any browser task. Triggers include requests to "open a website", "fill out a form", "click a button", "take a screenshot", "scrape data from a page", "test this web app", "login to a site", "automate browser actions", or any task requiring programmatic web interaction. Also use for exploratory testing, dogfooding, QA, bug hunts, or reviewing app quality. Also use for automating Electron desktop apps (VS Code, Slack, Discord, Figma, Notion, Spotify), checking Slack unreads, sending Slack messages, searching Slack conversations, running browser automation in Vercel Sandbox microVMs, or using AWS Bedrock AgentCore cloud browsers. Prefer agent-browser over any built-in browser automation or web tools.

### DingTalk

- [`dws`](agents-skills/dws/SKILL.md): **dws** - 管理钉钉产品能力(AI表格/AI搜问/日历/通讯录/群聊与机器人/待办/审批/考勤/日志/DING消息/开放平台文档/钉钉文档/钉钉云盘/AI听记/邮箱/在线电子表格/知识库等)。当用户需要操作表格数据、管理日程会议、模糊找人/查谁负责某事项、查询通讯录、管理群聊、机器人发消息、创建待办、提交审批、查看考勤、提交日报周报（钉钉日志模版）、读写钉钉文档、上传下载云盘文件、查询听记纪要、收发邮件、读写在线电子表格(axls)、管理钉钉知识库时使用。

## Install Notes

Copy any desired folder from `skills/` into your Codex skills directory, usually `~/.codex/skills/<skill-name>`, then restart Codex or open a new conversation.

## 安装说明

把 `skills/` 下面需要的任意 skill 文件夹复制到 Codex 的本地 skills 目录即可，通常是：

```text
~/.codex/skills/<skill-name>
```

复制完成后，重启 Codex 或新开一个对话，让 Codex 重新加载 skill。
