#!/bin/bash
#
# Vibe Learning - 全局安装脚本 (Linux / macOS)
# 将 skills 安装到 ~/.claude/skills/ 使其在任何仓库中可用
#

set -e

SOURCE="$(cd "$(dirname "$0")" && pwd)"
TARGET="$HOME/.claude/skills"

echo "Vibe Learning Skills 安装程序"
echo "==============================="
echo ""
echo "源目录:   $SOURCE/.claude/skills/"
echo "目标目录: $TARGET/"
echo ""

mkdir -p "$TARGET"

SKILLS=("rdp-builder" "res-builder" "workspace-init")

for skill in "${SKILLS[@]}"; do
    if [ -d "$SOURCE/.claude/skills/$skill" ]; then
        echo "安装 $skill ..."
        cp -r "$SOURCE/.claude/skills/$skill" "$TARGET/"
        echo "  ✓ $skill 已安装"
    else
        echo "  ⚠ $skill 未找到，跳过"
    fi
done

echo ""
echo "==============================="
echo "✅ 安装完成！"
echo ""
echo "已安装的 skills 在任何仓库中都可使用："
echo "  - res-builder:    整理原始资料为 .res 文件"
echo "  - rdp-builder:    从 .res 生成 .rdp 学习路线图"
echo "  - workspace-init: 初始化新的学习空间"
echo ""
echo "下一步："
echo "  1. 创建一个新目录用于学习"
echo "  2. 对 AI 说 '初始化学习空间'"
echo "  3. 准备学习材料，对 AI 说 '帮我整理这份资料'"
