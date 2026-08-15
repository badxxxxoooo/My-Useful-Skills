#!/usr/bin/env bash
# 方向 B：把 Hermes 本地的用户 skill 同步到 GitHub 仓库
# 区分「第三方开源」与「自创建」skill，分别放入不同目录
# 用法: bash push-skills.sh <owner>/<repo>
#   自创建名单: 本脚本同目录的 own-skills.txt（每行一个 skill 名）
#   第三方  -> 仓库 hermes-skills/<category>/<name>/
#   自创建  -> 仓库 own-skills/<category>/<name>/  （附 README 标明）
set -uo pipefail

REPO_SPEC="${1:?用法: push-skills.sh <owner>/<repo>}"
HERMES_HOME="${HERMES_HOME:-$HOME/.hermes}"
SKILLS_ROOT="$HERMES_HOME/skills"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
OWN_LIST="$SCRIPT_DIR/own-skills.txt"
THIRD_SUBDIR="hermes-skills"
OWN_SUBDIR="own-skills"
case "$(uname -s)" in
  MINGW*|MSYS*|CYGWIN*) WORK="${LOCALAPPDATA:-$TEMP}/Temp/skill-sync-$$"; mkdir -p "$WORK" ;;
  *) WORK="$(mktemp -d)" ;;
esac
REPO_DIR="$WORK/repo"
trap 'rm -rf "$WORK"' EXIT

echo "== 1/5 克隆仓库 $REPO_SPEC =="
gh repo clone "$REPO_SPEC" "$REPO_DIR" || { echo "克隆失败（检查 gh auth）"; exit 1; }

echo "== 2/5 读取内置 skill 名单（.bundled_manifest）=="
BUNDLED="$SKILLS_ROOT/.bundled_manifest"
[ -f "$BUNDLED" ] && cut -d: -f1 "$BUNDLED" > "$WORK/bundled.txt" || : > "$WORK/bundled.txt"

echo "== 3/5 复制 skill（区分自创建/第三方）=="
third=0; own=0
for sk in "$SKILLS_ROOT"/*/*/SKILL.md; do
  [ -f "$sk" ] || continue
  name=$(basename "$(dirname "$sk")")
  cat_dir=$(basename "$(dirname "$(dirname "$sk")")")
  grep -qxF "$name" "$WORK/bundled.txt" && continue   # 跳过内置
  if [ -f "$OWN_LIST" ] && grep -qxF "$name" "$OWN_LIST"; then
    dest="$REPO_DIR/$OWN_SUBDIR/$cat_dir/$name"
    echo "  [自创建] + $cat_dir/$name"
    own=$((own+1))
  else
    dest="$REPO_DIR/$THIRD_SUBDIR/$cat_dir/$name"
    echo "  [第三方] + $cat_dir/$name"
    third=$((third+1))
  fi
  mkdir -p "$(dirname "$dest")"
  # 先清空目标再复制：cp -r src dest 在 dest 已存在时会产生 <dest>/<src_basename>/ 嵌套
  rm -rf "$dest"
  mkdir -p "$dest"
  cp -r "$(dirname "$sk")"/. "$dest"/
done

echo "== 4/5 给自创建目录加说明 README =="
if [ "$own" -gt 0 ]; then
  cat > "$REPO_DIR/$OWN_SUBDIR/README.md" <<'EOF'
# own-skills（自创建 skill）

本目录存放**自己创建**的 skill，区别于 `hermes-skills/` 里的第三方开源 skill。

- 来源：在 Hermes 中用 `skill_manage` 或手动创建的本地 skill。
- 名单维护：`skill-repo-sync/scripts/own-skills.txt`（每行一个 skill 名，新增自建 skill 时把名字加进去）。
EOF
  echo "  已生成 own-skills/README.md"
fi

echo "== 5/5 提交并推送 =="
cd "$REPO_DIR"
git add -A
if git diff --cached --quiet; then
  echo "无变更，无需提交"
else
  git commit -m "sync: $third third-party + $own own skills"
  git push
  echo "完成：第三方 $third 个 -> $THIRD_SUBDIR/，自创建 $own 个 -> $OWN_SUBDIR/"
fi
