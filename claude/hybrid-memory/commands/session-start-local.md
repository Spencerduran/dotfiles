Start a new work session in the current project (uses local .claude/ directory).

This command is project-aware and will:
1. Look for `.claude/` in the current directory first
2. Fall back to `~/.claude/` if no local directory exists
3. Suggest running init-memory-here.sh if neither exists

## Steps:
1. Check for `.claude/sessions/` in current directory
2. If not found, check for `~/.claude/sessions/`
3. If neither exists, suggest initialization
4. Create new session file with:
   - Session name and timestamp as title
   - Current directory and project context
   - Git status snapshot (branch, uncommitted changes)
   - Detected project type (check for package.json, requirements.txt, etc.)
   - Active tasks if `docs/tasks/active/` exists
   - Initial goals section (ask user if not clear from context)

5. Update `.claude/sessions/.current-session` with the session filename

## Session File Template:
```markdown
# Session: [Name] - YYYY-MM-DD HH:MM

## Context
- **Directory**: [current working directory]
- **Project Type**: [detected type or "general"]
- **Git Branch**: [branch name]
- **Uncommitted Changes**: [count of files]
- **Session Scope**: [local or global]

## Goals
[User provided or inferred goals]

## Active Tasks
[List from docs/tasks/active/ if exists, otherwise "No project tasks found"]

## Progress Log
[Updates will be added here]
```

Show user:
- Session location (local .claude/ or ~/.claude/)
- Available commands for updates and status
- Reminder that this is project-specific if using local .claude/