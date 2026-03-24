#
# Vibe Learning - 全局安装脚本 (Windows PowerShell)
# 将 skills 安装到 ~/.claude/skills/ 使其在任何仓库中可用
#

$ErrorActionPreference = "Stop"

$Source = $PSScriptRoot
$Target = Join-Path $env:USERPROFILE ".claude\skills"

Write-Host "Vibe Learning Skills 安装程序" -ForegroundColor Cyan
Write-Host "===============================" -ForegroundColor Cyan
Write-Host ""
Write-Host "源目录:   $Source\.claude\skills\"
Write-Host "目标目录: $Target\"
Write-Host ""

if (-not (Test-Path $Target)) {
    New-Item -ItemType Directory -Path $Target -Force | Out-Null
}

$skills = @("rdp-builder", "res-builder", "workspace-init")

foreach ($skill in $skills) {
    $skillSource = Join-Path $Source ".claude\skills\$skill"
    $skillTarget = Join-Path $Target $skill

    if (Test-Path $skillSource) {
        Write-Host "安装 $skill ..."
        Copy-Item -Path $skillSource -Destination $skillTarget -Recurse -Force
        Write-Host "  ✓ $skill 已安装" -ForegroundColor Green
    } else {
        Write-Host "  ⚠ $skill 未找到，跳过" -ForegroundColor Yellow
    }
}

Write-Host ""
Write-Host "===============================" -ForegroundColor Cyan
Write-Host "✅ 安装完成！" -ForegroundColor Green
Write-Host ""
Write-Host "已安装的 skills 在任何仓库中都可使用："
Write-Host "  - res-builder:    整理原始资料为 .res 文件"
Write-Host "  - rdp-builder:    从 .res 生成 .rdp 学习路线图"
Write-Host "  - workspace-init: 初始化新的学习空间"
Write-Host ""
Write-Host "下一步："
Write-Host "  1. 创建一个新目录用于学习"
Write-Host "  2. 对 AI 说 '初始化学习空间'"
Write-Host "  3. 准备学习材料，对 AI 说 '帮我整理这份资料'"
