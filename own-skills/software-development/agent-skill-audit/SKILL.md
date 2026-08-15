---
name: agent-skill-audit
description: Use when 审计/清理 skill 集合（GitHub 仓库或 Codex 本地 skills）。
---

# Agent Skill 审计与清理

审计并清理 skill 集合：GitHub skill 仓库（死重/重复/嵌套检测、报表、安全删除）或 Codex 本地 skills（Codex 自主审计工作流）。

## 审计判定标准

| 类型 | 判定方法 |
|---|---|
| 死重 | 绑定本机不存在的框架/CLI（gstack/dws/bun/wx-cli）——看 SKILL.md frontmatter `description` 和正文依赖声明 |
| 废弃 | frontmatter 有 `[Deprecated: use X]` 标记 |
| 重复 | 跨目录同名（skills/ vs hermes-skills/ vs .agents/skills/）；功能重复对（tdd vs test-driven-development、write-a-skill vs writing-skills） |
| 嵌套冗余 | `<cat>/<name>/<name>/SKILL.md` 与 `<cat>/<name>/SKILL.md` 并存（同一 skill 两份） |
| 空壳 | SKILL.md <1KB 且无实际方法内容 |
| 过大 | >500KB 且价值低（占磁盘/上下文）——注意：SKILL.md 的 name+description 才进上下文，references/字体只占磁盘 |

## GitHub 仓库分析流程

1. `git pull` 本地 clone
2. 扫描各目录 SKILL.md（用 os.walk，别用 find -maxdepth 2——分类目录会更深）
3. 按 frontmatter `name` 去重统计唯一 skill 数；跨目录重复检测
4. 对比本机安装：`repo_hermes - hermes_local` = 未部署；`codex_local - repo` = 漏同步
5. 输出报表：总览表 / 第三方 vs 自创建分类 / 可删清单（分组 A 死重 B 重复 C 嵌套）

## 清理执行（安全顺序）

1. **dry-run**：脚本先打印待删清单（路径+分类），确认后执行
2. A 组（死重）/ B 组（重复）直接删目录；C 组（嵌套）删前**检查嵌套层支持文件**（references/scripts 等）——有就 `shutil.move` 合并到父层再删
3. 自创建目录（own-skills/）不删；`git add -A && commit && push`；push 后 `gh api` 验证远程 commit
4. 每类分组统计，commit message 写清每组数量

## Codex 自主审计工作流（用户偏好：Codex 自己执行，Hermes 把关）

1. 先扫描 `~/.codex/skills/` 现状（数量/大小/SKILL.md 有无）
2. **审计**：`codex exec "分析 ~/.codex/skills/，输出候选删除清单+理由"`（只读，明确「不要删除」）——codex exec 必须在 git 仓库里跑（临时目录 `git init`）
3. **Hermes 抽查验证**：读候选的 SKILL.md frontmatter 核实 Codex 判断（Deprecated 标记、CLI 依赖声明、是否真重复）——Codex 有时看 references 推断依赖，正文可能没有
4. **执行**：`codex exec --sandbox danger-full-access "删除清单目录，明确保留项，报告结果"`——必须 --sandbox danger-full-access（~/.codex 在工作区外）
5. **验证**：脚本确认 N/N 删除、保留项（.system/ 等）完好、剩余统计
6. 报告给用户：删了几个/释放空间/省 token 估算（每个 skill 的 name+description ≈ 几十 token）

## 陷阱

- codex exec 删除/写操作会触发 Hermes 审批：**超时未确认 = BLOCKED**，不能重试同命令，需等用户明确说「确认/go」再重新发起
- Codex 的审计结论要抽查——它可能漏掉明显死重（如 find-skills/using-superpowers）或误报（说依赖 $B 但正文没有）
- 巨型 skill 如 ckm-ui-styling（5.6MB 字体）功能有用 → 只减重不删
- 删除范围确认：先查待删项在 Hermes 是否有副本（`~/.codex/skills/` 与 `~/AppData/Local/hermes/skills/` 是两套独立目录，删 Codex 不影响 Hermes）
- 仓库清理后 Codex 本地可能有残留死重（仓库删了但 ~/.codex/skills/ 还有）——两处要分开清

## 报表格式参考

```
| 目录 | 唯一 skill 数 | 说明 |
| skills/ | N | 原始第三方（含死重） |
| hermes-skills/ | N | 已部署到 Hermes 的精选 |
| own-skills/ | N | 自创建（保留） |
+ 可删清单分组表（死重/重复/嵌套）+ 保留确认
```
