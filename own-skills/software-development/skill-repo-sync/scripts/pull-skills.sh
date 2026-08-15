#!/usr/bin/env bash
# 方向 A：从 GitHub 仓库批量安装 skill 到 Hermes
# 用法: bash pull-skills.sh <owner>/<repo> <skills_subdir> <category>
#   例: bash pull-skills.sh badxxxxoooo/My-Useful-Skills skills superpowers
set -uo pipefail

REPO_SPEC="${1:?用法: pull-skills.sh <owner>/<repo> <skills_subdir> <category>}"
SUBDIR="${2:-skills}"
CATEGORY="${3:-imported}"
HERMES_HOME="${HERMES_HOME:-$HOME/.hermes}"
case "$(uname -s)" in
  MINGW*|MSYS*|CYGWIN*) WORK="${LOCALAPPDATA:-$TEMP}/Temp/skill-sync-$$"; mkdir -p "$WORK" ;;
  *) WORK="$(mktemp -d)" ;;
esac
trap 'rm -rf "$WORK"' EXIT

echo "== 克隆仓库 =="
gh repo clone "$REPO_SPEC" "$WORK/repo" || { echo "克隆失败"; exit 1; }

count=0
fallback=0
CODEX_HOME="${CODEX_HOME:-$HOME/.codex}"
mkdir -p "$CODEX_HOME/skills"

for sk in "$WORK/repo/$SUBDIR"/*/SKILL.md; do
  [ -f "$sk" ] || continue
  name=$(basename "$(dirname "$sk")")
  echo "== 安装 $name（Hermes:$CATEGORY + Codex:平铺）=="
  # Hermes
  if timeout 150 hermes skills install "$REPO_SPEC/$SUBDIR/$name" --category "$CATEGORY" --yes 2>&1 | grep -q "Installed:"; then
    echo "  Hermes OK (install)"
    count=$((count+1))
  else
    echo "  Hermes install 失败，直接复制兜底"
    cp -r "$(dirname "$sk")" "$HERMES_HOME/skills/$CATEGORY/$name"
    fallback=$((fallback+1))
  fi
  # Codex（平铺）
  cp -r "$(dirname "$sk")" "$CODEX_HOME/skills/$name"
  echo "  Codex OK"
done

echo "完成：hermes install 成功 $count 个，兜底复制 $fallback 个"
