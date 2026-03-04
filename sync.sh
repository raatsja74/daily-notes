#!/bin/bash
# Syncs today's Obsidian daily note to this repo and pushes if changed.
# Runs via launchd every 15 minutes.

set -euo pipefail

VAULT_DAILY="/Users/jadenraats/Library/Mobile Documents/iCloud~md~obsidian/Documents/★ Main Vault/50 Daily Notes"
REPO_DIR="/Users/jadenraats/Developer/Tools/daily-notes"
TODAY=$(date +%Y-%m-%d)
SOURCE="$VAULT_DAILY/$TODAY.md"
DEST="$REPO_DIR/$TODAY.md"

# Also maintain a "today.md" symlink/copy for stable URL
LATEST="$REPO_DIR/today.md"

cd "$REPO_DIR"

# If today's note doesn't exist yet, exit silently
[ -f "$SOURCE" ] || exit 0

cp "$SOURCE" "$DEST"
cp "$SOURCE" "$LATEST"

# Only commit+push if something changed
if git diff --quiet HEAD -- 2>/dev/null && [ -z "$(git ls-files --others --exclude-standard)" ]; then
    exit 0
fi

git add -A
git commit -m "sync: $TODAY $(date +%H:%M)"
git push origin main 2>/dev/null || git push -u origin main
