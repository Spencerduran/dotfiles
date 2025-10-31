#!/bin/bash

# Initialize hybrid memory system in the current project directory
# This allows you to use the memory system within specific folders/projects

set -e

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Get the directory where this script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
COMMANDS_DIR="$SCRIPT_DIR/commands"

# Current directory (where we're initializing)
PROJECT_DIR="$(pwd)"
PROJECT_NAME="$(basename "$PROJECT_DIR")"

echo -e "${BLUE}Initializing hybrid memory system in: ${NC}$PROJECT_DIR"

# Create .claude directory structure in current project
mkdir -p "$PROJECT_DIR/.claude"
mkdir -p "$PROJECT_DIR/.claude/sessions"
mkdir -p "$PROJECT_DIR/.claude/commands"

# Create a project config file
cat > "$PROJECT_DIR/.claude/config" << EOF
# Hybrid Memory Configuration
# Generated: $(date)
PROJECT_NAME="$PROJECT_NAME"
PROJECT_PATH="$PROJECT_DIR"
INITIALIZED_AT="$(date +%Y-%m-%d_%H:%M:%S)"
EOF

# Create symbolic links to commands in the project's .claude directory
echo -e "${BLUE}Setting up command links...${NC}"
for cmd in "$COMMANDS_DIR"/*.md; do
    cmd_name=$(basename "$cmd")
    ln -sf "$cmd" "$PROJECT_DIR/.claude/commands/$cmd_name"
    echo "  ✓ Linked $cmd_name"
done

# Create a project-specific CLAUDE.md if it doesn't exist
if [ ! -f "$PROJECT_DIR/CLAUDE.md" ]; then
    echo -e "${BLUE}Creating project CLAUDE.md...${NC}"
    cat > "$PROJECT_DIR/CLAUDE.md" << 'EOF'
# CLAUDE.md - Project Instructions

This file provides guidance to Claude Code when working with this project.

## Project Overview
[Describe your project here]

## Key Directories
- `.claude/` - Hybrid memory system (sessions, commands)
- `.claude/sessions/` - Work session tracking
- `docs/tasks/` - Optional task management (create with /init-project)

## Memory System Commands
Quick reference for the hybrid memory system:

### Essential Commands
- `/session-start [name]` - Begin tracking work
- `/session [notes]` - Update progress
- `/end` - Finish with summary
- `/status` - Check current state

### Optional Commands
- `/init-project` - Create task structure (for complex projects)
- `/tasks` - Update task documentation

## Development Workflow
[Add your specific workflow notes here]

## Important Notes
[Add any project-specific instructions here]
EOF
    echo -e "${GREEN}✓ Created CLAUDE.md${NC}"
else
    echo -e "${YELLOW}CLAUDE.md already exists, skipping...${NC}"
fi

# Add .claude to .gitignore if it exists and not already ignored
if [ -f "$PROJECT_DIR/.gitignore" ]; then
    if ! grep -q "^\.claude" "$PROJECT_DIR/.gitignore"; then
        echo -e "${BLUE}Adding .claude to .gitignore...${NC}"
        echo -e "\n# Claude hybrid memory system\n.claude/" >> "$PROJECT_DIR/.gitignore"
        echo -e "${GREEN}✓ Updated .gitignore${NC}"
    else
        echo -e "${YELLOW}.claude already in .gitignore${NC}"
    fi
else
    echo -e "${BLUE}Creating .gitignore with .claude entry...${NC}"
    echo -e "# Claude hybrid memory system\n.claude/" > "$PROJECT_DIR/.gitignore"
    echo -e "${GREEN}✓ Created .gitignore${NC}"
fi

# Create initial session file
SESSION_FILE="$PROJECT_DIR/.claude/sessions/$(date +%Y-%m-%d-%H%M)-init.md"
cat > "$SESSION_FILE" << EOF
# Session: Initialization - $(date '+%Y-%m-%d %H:%M')

## Context
- **Directory**: $PROJECT_DIR
- **Project**: $PROJECT_NAME
- **Initialized**: $(date)

## Setup Notes
- Hybrid memory system initialized
- Commands available via /session-start, /session, /end, /status
- Optional: Run /init-project for task management structure

## Next Steps
1. Start a work session with \`/session-start [description]\`
2. Track progress with \`/session [notes]\`
3. End sessions with \`/end\` for automatic summaries
EOF

echo "$SESSION_FILE" > "$PROJECT_DIR/.claude/sessions/.current-session"

echo ""
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}✓ Hybrid memory system initialized successfully!${NC}"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo -e "${BLUE}Project:${NC} $PROJECT_NAME"
echo -e "${BLUE}Location:${NC} $PROJECT_DIR"
echo ""
echo -e "${BLUE}Quick Start:${NC}"
echo "  1. Open Claude Code in this directory"
echo "  2. Use /session-start to begin tracking work"
echo "  3. Use /session to update progress"
echo "  4. Use /end to finish with a summary"
echo ""
echo -e "${BLUE}Optional:${NC}"
echo "  - Run /init-project for task management (complex projects)"
echo "  - Edit CLAUDE.md to add project-specific instructions"
echo ""
echo -e "${YELLOW}Note:${NC} .claude/ directory has been added to .gitignore"