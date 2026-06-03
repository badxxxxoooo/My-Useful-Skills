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
- Microsoft Playwright CLI: `microsoft/playwright-cli`
- Additional local Codex skills: manually backed up from installed local skills

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

### Additional Installed Skills

Supplemental local skills backed up from this Codex install that were not yet included in the original third-party source groups.

## Skill Index

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

- [`gstack`](skills/gstack/SKILL.md): **gstack** - |
- [`autoplan`](skills/autoplan/SKILL.md): **autoplan** - |
- [`benchmark`](skills/benchmark/SKILL.md): **benchmark** - |
- [`benchmark-models`](skills/benchmark-models/SKILL.md): **benchmark-models** - |
- [`browse`](skills/browse/SKILL.md): **browse** - |
- [`hackernews-frontpage`](skills/hackernews-frontpage/SKILL.md): **hackernews-frontpage** - Scrape the Hacker News front page (titles, points, comment counts).
- [`canary`](skills/canary/SKILL.md): **canary** - |
- [`careful`](skills/careful/SKILL.md): **careful** - |
- [`codex`](skills/codex/SKILL.md): **codex** - |
- [`context-restore`](skills/context-restore/SKILL.md): **context-restore** - |
- [`context-save`](skills/context-save/SKILL.md): **context-save** - |
- [`cso`](skills/cso/SKILL.md): **cso** - |
- [`design-consultation`](skills/design-consultation/SKILL.md): **design-consultation** - |
- [`design-html`](skills/design-html/SKILL.md): **design-html** - |
- [`design-review`](skills/design-review/SKILL.md): **design-review** - |
- [`design-shotgun`](skills/design-shotgun/SKILL.md): **design-shotgun** - |
- [`devex-review`](skills/devex-review/SKILL.md): **devex-review** - |
- [`document-generate`](skills/document-generate/SKILL.md): **document-generate** - |
- [`document-release`](skills/document-release/SKILL.md): **document-release** - |
- [`freeze`](skills/freeze/SKILL.md): **freeze** - |
- [`gstack-upgrade`](skills/gstack-upgrade/SKILL.md): **gstack-upgrade** - |
- [`guard`](skills/guard/SKILL.md): **guard** - |
- [`health`](skills/health/SKILL.md): **health** - |
- [`investigate`](skills/investigate/SKILL.md): **investigate** - |
- [`land-and-deploy`](skills/land-and-deploy/SKILL.md): **land-and-deploy** - |
- [`landing-report`](skills/landing-report/SKILL.md): **landing-report** - |
- [`learn`](skills/learn/SKILL.md): **learn** - |
- [`make-pdf`](skills/make-pdf/SKILL.md): **make-pdf** - |
- [`office-hours`](skills/office-hours/SKILL.md): **office-hours** - |
- [`open-gstack-browser`](skills/open-gstack-browser/SKILL.md): **open-gstack-browser** - |
- [`gstack-openclaw-ceo-review`](skills/gstack-openclaw-ceo-review/SKILL.md): **gstack-openclaw-ceo-review** - Use when asked to review a plan, challenge a proposal, run a CEO review, poke holes in an approach, think bigger about scope, or decide whether to expand or reduce the plan.
- [`gstack-openclaw-investigate`](skills/gstack-openclaw-investigate/SKILL.md): **gstack-openclaw-investigate** - Use when asked to debug, fix a bug, investigate an error, or do root cause analysis, and when users report errors, stack traces, unexpected behavior, or say something stopped working.
- [`gstack-openclaw-office-hours`](skills/gstack-openclaw-office-hours/SKILL.md): **gstack-openclaw-office-hours** - Use when asked to brainstorm, evaluate whether an idea is worth building, run office hours, or think through a new product idea or design direction before any code is written.
- [`gstack-openclaw-retro`](skills/gstack-openclaw-retro/SKILL.md): **gstack-openclaw-retro** - Weekly engineering retrospective. Analyzes commit history, work patterns, and code quality metrics with persistent history and trend tracking. Team-aware with per-person contributions, praise, and growth areas. Use when asked for weekly retro, what shipped this week, or engineering retrospective.
- [`pair-agent`](skills/pair-agent/SKILL.md): **pair-agent** - |
- [`plan-ceo-review`](skills/plan-ceo-review/SKILL.md): **plan-ceo-review** - |
- [`plan-design-review`](skills/plan-design-review/SKILL.md): **plan-design-review** - |
- [`plan-devex-review`](skills/plan-devex-review/SKILL.md): **plan-devex-review** - |
- [`plan-eng-review`](skills/plan-eng-review/SKILL.md): **plan-eng-review** - |
- [`plan-tune`](skills/plan-tune/SKILL.md): **plan-tune** - |
- [`qa`](skills/qa/SKILL.md): **qa** - |
- [`qa-only`](skills/qa-only/SKILL.md): **qa-only** - |
- [`retro`](skills/retro/SKILL.md): **retro** - |
- [`review`](skills/review/SKILL.md): **review** - |
- [`scrape`](skills/scrape/SKILL.md): **scrape** - |
- [`setup-browser-cookies`](skills/setup-browser-cookies/SKILL.md): **setup-browser-cookies** - |
- [`setup-deploy`](skills/setup-deploy/SKILL.md): **setup-deploy** - |
- [`setup-gbrain`](skills/setup-gbrain/SKILL.md): **setup-gbrain** - |
- [`ship`](skills/ship/SKILL.md): **ship** - |
- [`skillify`](skills/skillify/SKILL.md): **skillify** - |
- [`sync-gbrain`](skills/sync-gbrain/SKILL.md): **sync-gbrain** - |
- [`unfreeze`](skills/unfreeze/SKILL.md): **unfreeze** - |

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
- [`caveman`](skills/caveman/SKILL.md): **caveman** - >
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

### Additional Installed Skills

- [`frontend-design`](skills/frontend-design/SKILL.md): **frontend-design** - Create distinctive, production-grade frontend interfaces with high design quality. Use this skill when the user asks to build web components, pages, artifacts, posters, or applications.
- [`pdf`](skills/pdf/SKILL.md): **pdf** - Use when tasks involve reading, creating, or reviewing PDF files where rendering and layout matter; prefer visual checks by rendering pages and use PDF tooling for generation and extraction.
- [`playwright`](skills/playwright/SKILL.md): **playwright** - Use when the task requires automating a real browser from the terminal via `playwright-cli` or the bundled wrapper script.
- [`skill-creator`](skills/skill-creator/SKILL.md): **skill-creator** - Create new skills, modify and improve existing skills, and measure skill performance.

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

## Install Notes

Copy any desired folder from `skills/` into your Codex skills directory, usually `~/.codex/skills/<skill-name>`, then restart Codex or open a new conversation.

## 安装说明

把 `skills/` 下面需要的任意 skill 文件夹复制到 Codex 的本地 skills 目录即可，通常是：

```text
~/.codex/skills/<skill-name>
```

复制完成后，重启 Codex 或新开一个对话，让 Codex 重新加载 skill。
