#!/usr/bin/env bash
# Install Claude Code config from dotfiles
# Usage: bash ~/Documents/dotfiles/claude/install.sh

set -euo pipefail

DOTFILES_CLAUDE="$(cd "$(dirname "$0")" && pwd)"
CLAUDE_HOME="$HOME/.claude"

mkdir -p "$CLAUDE_HOME/commands"

# Symlink global config
for file in CLAUDE.md settings.json; do
  target="$CLAUDE_HOME/$file"
  source="$DOTFILES_CLAUDE/$file"
  if [ -e "$target" ] && [ ! -L "$target" ]; then
    echo "Backing up existing $file → $file.bak"
    mv "$target" "$target.bak"
  fi
  ln -sf "$source" "$target"
  echo "Linked $file"
done

# Symlink slash commands (skip dirs like gsd/)
for file in "$DOTFILES_CLAUDE"/commands/*.md; do
  [ -f "$file" ] || continue
  name="$(basename "$file")"
  target="$CLAUDE_HOME/commands/$name"
  if [ -e "$target" ] && [ ! -L "$target" ]; then
    mv "$target" "$target.bak"
  fi
  ln -sf "$file" "$target"
  echo "Linked commands/$name"
done

echo ""
echo "Done. Remaining manual steps:"
echo "  1. npx get-shit-done-cc@latest"
echo "  2. Open Claude Code → /plugin → install personal-os-skills, superpowers, atlassian"
