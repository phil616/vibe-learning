#!/usr/bin/env bash
# sync-repo.sh - 以远程仓库为权威数据源强制同步本地目录
# 用法: ./sync-repo.sh [分支名，默认 main]

set -euo pipefail

# ─── 配置区 ────────────────────────────────────────────────
REPO_URL="https://<username>:<password>@cnb.cool/greenshadecapital/vibe-learning-data"   # 或 https://...
LOCAL_DIR="/root/learning"                   # 本地同步目录
BRANCH="${1:-main}"                                 # 支持传入分支参数
LOG_FILE="/var/log/git-sync.log"
# ────────────────────────────────────────────────────────────

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*" | tee -a "$LOG_FILE"
}

log "=== 开始同步 branch: $BRANCH ==="

# 1. 若目录不存在则初次克隆
if [ ! -d "$LOCAL_DIR/.git" ]; then
    log "本地目录不存在，执行初次克隆..."
    git clone --branch "$BRANCH" "$REPO_URL" "$LOCAL_DIR"
    log "克隆完成"
    exit 0
fi

cd "$LOCAL_DIR"

# 2. 确保 remote 指向正确
git remote set-url origin "$REPO_URL"

# 3. 核心：以远程为权威强制同步（不产生任何 merge commit）
log "正在 fetch..."
git fetch origin "$BRANCH"

log "强制重置到 origin/$BRANCH..."
git checkout "$BRANCH" 2>/dev/null || git checkout -b "$BRANCH" --track "origin/$BRANCH"
git reset --hard "origin/$BRANCH"

# 4. 清理未跟踪文件（可选，保持目录与仓库完全一致）
git clean -fd

log "=== 同步完成，当前 commit: $(git rev-parse --short HEAD) ==="