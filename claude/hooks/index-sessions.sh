#!/bin/bash
# Extract recent Claude sessions to markdown and refresh the qmd index.
# Run from Stop/SessionEnd hooks in settings.json.
VAULT_DIR="$HOME/vaults/local_memory"
python3 ~/.claude/plugins/marketplaces/personal-os-skills/skills/recall/scripts/extract-sessions.py \
  --days 3 --output "$VAULT_DIR/claude-sessions-qmd"
qmd update --quiet
# Embedding can take minutes; detach so the hook doesn't time out.
nohup qmd embed >/dev/null 2>&1 &
