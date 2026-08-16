---
name: web-dashboard-layout
description: Use when 做可定制面板布局（拖拽/调大小/显隐）。首选 gridstack.js，别手写。
version: 1.0.0
author: Hermes Agent (created for user Carmy)
license: MIT
platforms: [linux, macos, windows]
metadata:
  hermes:
    tags: [frontend, layout, gridstack, drag-drop, dashboard, pywebview]
    related_skills: [frontend-design, desktop-app-packaging, python-desktop-app-shipping]
---

# Web 可定制面板布局（Dashboard Layout）

用户要「模块能拖动排序、能调大小、能显示/隐藏、动画平滑」的可定制工作台时，**用现成库，不要自己写拖拽/调宽逻辑**。

## 为什么（真实教训）

自己写 DIY 方案（点击轮换宽度 + 原生 drag API）被用户实测否掉，三个问题：
1. 「点一下大小就自己跳动」——点击轮换宽度是反直觉交互，用户期望的是**按住拖动**调宽
2. 排序拖拽有 bug（drop 事件处理不可靠）
3. 无平滑动画，观感生硬

教训：**交互类 UI 需求（拖拽/调宽/排序/动画）是成熟领域，先找 star 验证过的库**（用户标准：被市场验证过的头部项目）。同类库对比：
- **gridstack.js**（~9k★）— dashboard 布局专用：拖拽排序 + resize 手柄 + 平滑动画 + 紧凑排列，首选
- SortableJS（~31k★）— 列表重排，不做网格/resize
- muuri（~11k★）— 响应式网格，API 较复杂

## 集成步骤（gridstack，本地离线前端）

### 1. 下载（大陆网络：npm registry 可达，GitHub release 可能被墙）
```bash
cd <项目根>
npm pack gridstack@13.1.2        # 得到 gridstack-<ver>.tgz
```
解压 tgz（tarfile，不是 zipfile）后取 `package/dist/` 里两个文件：
- `gridstack-all.js`（86KB，浏览器 UMD 单文件，含全部依赖）
- `gridstack.min.css`（6KB）
复制到项目前端目录。

### 2. HTML 引入
```html
<link rel="stylesheet" href="./gridstack.min.css" />
<script src="./gridstack-all.js"></script>
<script src="./app.js"></script>
```
容器加类：`<div class="workspace grid-stack">`

### 3. 后端静态服务必须注册（否则 404）
`backend/server.py` 的 `STATIC_FILES` 白名单加两个路径。**漏了就是 404，页面功能静默缺失。**

### 4. PyInstaller 打包必须加进 spec
`company-ledger.spec` 的 `datas` 加 `("gridstack-all.js", ".")` 和 `("gridstack.min.css", ".")`。**漏了绿色版里布局失效。**

### 5. JS 初始化要点
```js
// 摊平：把 .main-column / .side-column 等包装 div 的子面板提升为 grid 直接子级，
// 并把容器外的面板（如报表）移进来——gridstack 只认直接子项
[...mainCol.children].forEach(el => ws.insertBefore(el, mainCol)); mainCol.remove();

// 每个面板：加 grid-stack-item 类 + data-gs-x/y/w/h
el.classList.add("grid-stack-item");
el.dataset.gsW = "6"; el.dataset.gsH = "9";

// 标题栏 = 拖拽手柄（不要整卡可拖，会与表单交互冲突）
head.classList.add("panel-head"); // 拖拽交给 gridstack 的 handle 选项

// 初始化
grid = GridStack.init({
  column: 12, cellHeight: 34, margin: 6,
  animate: true,        // 平滑动画（用户明确要求）
  float: false,         // 紧凑排列不留空白，其他面板自动补位
  resizable: { handles: "e, se, s, sw, w" },   // 四边/四角拖动调宽
  draggable: { handle: ".panel-head", scroll: false },
  alwaysShowResizeHandle: true,
}, ws);

// 持久化：change / resizestop / dragstop 事件里读 grid.engine.nodes 存 localStorage
grid.on("resizestop", () => saveGridState(grid.engine.nodes));

// 显示/隐藏：隐藏 = grid.removeWidget(el, false) + el.hidden=true；
// 恢复 = grid.makeWidget(el) + grid.update(el, {w,h})（保留原尺寸）
```

## 陷阱清单

- **npm pack 下载的是 .tgz**（gzip），Python 解压用 `tarfile.open(..., "r:gz")`，不是 zipfile
- **gridstack-all.js 是浏览器 UMD**：node --check 能过但无法 require 测逻辑；逻辑测试用 node 模拟纯函数（排序/持久化 round-trip）
- 布局持久化格式：`{items:[{id,x,y,w,h}], hidden:[ids]}`，版本兼容（旧 DIY 格式要兼容或 reset）
- 窄屏回退：`@media (max-width:900px)` 强制单列（gridstack 自带 oneColumnMode 或 CSS 覆盖）
- 面板内表单/输入控件：拖拽手柄只放标题栏（`.panel-head`），否则输入框无法聚焦/选择文本
- 深色模式：resize 手柄、拖动阴影要跟着主题变量走，别写死颜色

## 验收

- 拖面板标题 → 排序，其他面板平滑让位不留空白
- 拖四边/四角手柄 → 平滑调宽，无"跳动"
- 布局刷新/重启后保持；隐藏的面板能从「布局」弹窗恢复
- 窄窗口自动单列；深色主题下控件可见
