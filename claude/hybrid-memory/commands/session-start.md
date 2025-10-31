Start a new work session to track progress and maintain context.

Create a session file in `.claude/sessions/` with format `YYYY-MM-DD-HHMM-$ARGUMENTS.md` (or just timestamp if no name).

## Steps:
1. Create `.claude/sessions/` directory if it doesn't exist
2. Create new session file with:
   - Session name and timestamp as title
   - Current directory and project context
   - Git status snapshot (branch, uncommitted changes)
   - Detected project type (check for package.json, requirements.txt, etc.)
   - Active tasks if `docs/tasks/active/` exists
   - Initial goals section (ask user if not clear from context)

3. Update `.claude/sessions/.current-session` with the session filename

4. If this is the first session in a project, ask if user wants to initialize project docs with `/init-project`

## Session File Template:
```markdown
# Session: [Name] - YYYY-MM-DD HH:MM

## Context
- **Directory**: [current working directory]
- **Project Type**: [detected type or "general"]
- **Git Branch**: [branch name]
- **Uncommitted Changes**: [count of files]

## Goals
[User provided or inferred goals]

## Active Tasks
[List from docs/tasks/active/ if exists, otherwise "No project tasks found"]

## Progress Log
[Updates will be added here]
```

Confirm session started and show user they can:
- Update with `/session` or `/session-update [notes]`
- End with `/end` or `/session-end`
- Check status with `/status` or `/session-status`