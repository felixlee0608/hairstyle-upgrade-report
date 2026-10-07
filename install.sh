#!/usr/bin/env bash
#
# HairStyle Upgrade Report Skill - 一键安装脚本 (macOS / Linux)
#
# 用法：
#   bash install.sh                     # 自动探测并安装到检测到的技能目录
#   bash install.sh --path <目录>       # 安装到指定目录（如 ~/.codex/skills）
#
# 自动探测顺序：
#   Doubao Work (.user_skills) > Claude Code (~/.claude/skills)
#   > Codex (~/.codex/skills) > 通用 (~/.agents/skills) > QwenWork (~/.qwenworkcn/skills)
#
set -euo pipefail

SKILL_NAME="hairstyle-upgrade-report"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE="$SCRIPT_DIR/$SKILL_NAME"

# --- 校验技能源存在 ---
if [[ ! -f "$SOURCE/SKILL.md" ]]; then
  echo "错误：未在脚本同目录找到 $SKILL_NAME/SKILL.md"
  echo "请确认 install.sh 与技能文件夹 $SKILL_NAME/ 位于同一目录。"
  exit 1
fi

# --- 解析参数 ---
TARGET=""
while [[ $# -gt 0 ]]; do
  case "$1" in
    --path)
      TARGET="${2:-}"
      if [[ -z "$TARGET" ]]; then
        echo "错误：--path 后需要目录参数"; exit 1
      fi
      shift 2
      ;;
    -h|--help)
      echo "用法：bash install.sh [--path <技能安装目录>]"
      exit 0
      ;;
    *)
      echo "未知参数：$1（使用 --help 查看用法）"; exit 1
      ;;
  esac
done

# --- 自动探测安装目录 ---
if [[ -z "$TARGET" ]]; then
  CANDIDATES=(
    "$HOME/Library/Application Support/DoubaoWork"/*/agent_mode/workspace/.user_skills
    "$HOME/.claude/skills"
    "$HOME/.codex/skills"
    "$HOME/.agents/skills"
    "$HOME/.qwenworkcn/skills"
  )
  for d in "${CANDIDATES[@]}"; do
    if [[ -d "$d" ]]; then
      TARGET="$d"
      echo "检测到技能目录：$d"
      break
    fi
  done
fi

if [[ -z "$TARGET" ]]; then
  TARGET="$HOME/.agents/skills"
  echo "未检测到现有技能目录，将创建：$TARGET"
fi

# --- 安装 ---
mkdir -p "$TARGET"
if [[ -d "$TARGET/$SKILL_NAME" ]]; then
  echo "检测到已安装的 $SKILL_NAME，正在覆盖更新…"
fi
rm -rf "$TARGET/$SKILL_NAME"
cp -R "$SOURCE" "$TARGET/$SKILL_NAME"

echo ""
echo "=============================================="
echo "✅ 安装完成：$TARGET/$SKILL_NAME"
echo "=============================================="
echo "已安装文件："
ls -1 "$TARGET/$SKILL_NAME"
echo ""
echo "下一步：重启 / 刷新你的智能体，然后上传一张正面照片，"
echo "说“帮我做一份发型升级报告”即可使用。"
