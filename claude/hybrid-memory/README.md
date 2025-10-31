# Hybrid Memory System for Claude Code

A minimal, intelligent memory system that combines session tracking with optional project documentation.

## Installation

```bash
# From your dotfiles directory
ln -s ~/dotfiles/claude/hybrid-memory/commands ~/.claude/commands
```

## Quick Start

You only need 3 commands for 90% of use cases:

1. **`/session-start`** - Begin tracking work
2. **`/session`** - Update progress (optional)
3. **`/end`** - Finish with summary

That's it! The system handles everything else automatically.

## Features

### 🧠 Smart Session Tracking
- Automatically captures git changes
- Tracks files modified, created, deleted
- Integrates with Claude's TodoWrite tool
- Generates comprehensive summaries
- Maintains context between sessions

### 📋 Optional Project Documentation
- Use `/init-project` only for complex projects
- Organized task management (active/backlog/completed)
- Persistent knowledge base
- Perfect for team handoffs

### ⚡ Minimal Commands
- Short aliases for everything (`/end`, `/status`, `/session`)
- Intelligent defaults - no configuration needed
- Works from any directory
- Auto-detects project type

## Command Reference

### Essential Commands
- `/session-start [name]` - Start new session
- `/session [notes]` - Update current session  
- `/end` - End with summary
- `/status` - Check current state

### Optional Commands
- `/init-project` - Create project structure (complex projects only)
- `/tasks` - Update task documentation
- `/session-help` - Show help

## Examples

### Simple Bug Fix
```bash
/session-start fix-auth
# ... work happens ...
/session "Found and fixed race condition"
/end
```

### Feature Development
```bash
/session-start dark-mode
# ... implement feature ...
/session
# ... more work ...
/status  # Check progress
/end
```

### Complex Project
```bash
/init-project my-app  # First time only
/session-start
# ... work on tasks ...
/tasks  # Update task docs
/end
```

See [EXAMPLES.md](EXAMPLES.md) for detailed workflows.

## Design Philosophy

1. **Minimal by Default** - Just 3 commands for most work
2. **Progressive Enhancement** - Add project docs only when needed
3. **Automatic Tracking** - System captures context without asking
4. **Intelligent Updates** - Knows what's important to track
5. **Human-Readable** - All files are simple markdown

## File Structure

```
.claude/
├── sessions/              # Session files (automatic)
│   ├── 2024-01-15-0930-feature.md
│   └── .current-session   # Active session tracker
└── commands/              # Symlinked commands

docs/                      # Optional project docs
├── tasks/
│   ├── active/
│   ├── backlog/
│   └── completed/
└── quick-reference.md
```

## Why Hybrid?

This system combines:
- **Session memory** (temporal, automatic) - Great for daily work
- **Project docs** (persistent, structured) - Great for complex projects

Use one or both depending on your needs. The system is smart enough to integrate them when both exist.

## Tips

- Use `/session` whenever you want - it's smart about what to track
- Don't worry about forgetting commands - `/status` shows everything
- Let the system work for you - it tracks git, todos, and progress automatically
- Start simple - add project docs only when you need them

## Requirements

- Claude Code (claude.ai/code)
- Git repository (optional but recommended)
- Bash/Zsh shell

## License

Personal use - feel free to modify for your needs!