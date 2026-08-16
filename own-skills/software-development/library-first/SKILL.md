---
name: library-first
description: "Use when 复杂任务含通用功能（拖拽/图表/排版等）：先到 GitHub 找现成库再动手，融合成熟方案不造轮子。"
version: 1.0.0
author: Hermes Agent (created for user Carmy)
license: MIT
platforms: [linux, macos, windows]
metadata:
  hermes:
    tags: [library-first, reuse, github, research, best-practice]
    related_skills: [frontend-design, task-router, agent-skill-discovery]
---

# Library-First（先找库，再动手）

**核心规则：完成偏复杂的任务时，先到 GitHub 等网上现有库中寻找有没有类似功能，把成熟方案融合进任务，而不是从零实现。**

## When to Use

- 任务包含**通用型功能**：拖拽排序、图表、富文本、PDF、OCR、状态管理、动画、日期处理、弹窗等
- 任务需要 30+ 行自定义代码才能实现的基础能力
- 用户说"看看网上有没有类似的"、"有没有现成的库"

**不适用**：纯业务逻辑、公司特有规则、简单一次性脚本（自己写更快）

## 搜索流程（按序执行）

1. **GitHub 搜索**（最优先）：
   ```bash
   gh search repos "<关键词>" --sort stars --limit 10 \
     --json fullName,stargazersCount,description
   gh api "repos/<owner>/<repo>" --jq '.stargazers_count, .description, .updated_at'
   ```
   关键词用英文，一次多组：`"drag and drop grid"`、`"resizable layout"`、`"charts"`

2. **npm 验证**（确认可分发）：
   ```bash
   curl -s -o /dev/null -w "%{http_code}" https://registry.npmjs.org/<pkg>
   npm pack <pkg>@<version>    # 下载 tarball 看体积
   ```

3. **头部 skill/工具仓库兜底**：anthropics/skills、obra/superpowers 等官方生态里也可能有对应 skill

## 选库标准（用户偏好：star = 市场验证）

| 维度 | 标准 |
|---|---|
| **star 数** | 优先高 star（如 gridstack 9k★、SortableJS 31k★）；低 star 的 niche 项目一般不选 |
| **维护状态** | 最近一年有 release/commit（gh api 查 updated_at） |
| **体积** | 单文件优先（如 gridstack-all.js 86KB），避免引入整个框架 |
| **依赖** | 无框架依赖 > 需要 React/Vue（本项目是原生 JS） |
| **离线可用** | 必须能内置本地（绿色版无网络），不用 CDN |

## 集成方式（按场景选）

| 场景 | 方式 |
|---|---|
| 纯前端库 | 下载单文件 → 放项目根 → 本地 `<script>`/`<link>` 引入 |
| 需要后端服务 | 检查是否依赖外部服务，本地化或换方案 |
| 有打包流程 | 把文件加进打包 spec 的 datas（如 PyInstaller spec） |

**本项目的静态服务注意**：本地 HTTP 服务的静态文件是**白名单**（如 backend/server.py 的 `STATIC_FILES`），新增库文件必须同步注册，否则 404。

## 融合技巧

1. **不要推翻现有架构**——库只做"它擅长的一层"（如 gridstack 管拖拽布局，数据/样式仍走项目自己的）
2. **旧实现保留备份再替换**——先 `git commit` 旧代码，替换后可回滚
3. **验收跑原有测试**——引入库后全量测试必须仍通过（本项目 72 个 pytest + node）
4. **打包版实测**——exe 里库文件要能加载（HTTP 200），不只是开发环境能用

## 实战案例（本项目的真实教训）

- **需求**：记账 App 可定制工作台布局（拖拽排序 + 调大小 + 动画）
- **第一版（错误）**：自己写 DIY 拖拽 + 点击轮换宽度 → 体验差（跳动）、排序有 bug
- **第二版（正确）**：`gh search "resizable grid layout"` → 找到 gridstack.js（9k★）→ 下载 86KB 单文件内置 → 拖拽/调宽/动画全解决
- **教训**：通用交互功能（拖拽/图表/动画）永远是成熟库 > 自研。自研 1-2 天还有 bug，集成库 30 分钟。

## Pitfalls

- **只看 star 不看维护**：高 star 但 3 年没更新也要谨慎（可能有更好的替代）
- **忘记注册静态白名单**：前端文件能被页面引用 ≠ 后端服务会提供（404 就在这）
- **库体积失控**：选单文件版，别把整个框架 node_modules 拖进来
- **引入后不测试**：库和现有代码可能冲突（如 CSS 类名覆盖），必须跑全量测试
- **抄错版本**：README 的 API 和实际下载的版本可能不一致，以下载的 dist 为准
