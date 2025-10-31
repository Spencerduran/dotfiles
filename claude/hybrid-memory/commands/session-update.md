Update the current session with progress. Can be called with just `/session` for automatic update.

## Usage:
- `/session` - Automatic update based on recent activity
- `/session [notes]` - Add specific notes
- `/session-update [notes]` - Full command name

## Steps:
1. Check `.claude/sessions/.current-session` for active session
2. If no session exists, start one automatically
3. Append update to session file with:

### Automatic Context (always included):
- Timestamp
- Git changes summary (files modified/added/deleted)
- Todo list progress (if using TodoWrite tool)
- Task progress (if `docs/tasks/` exists)
- Recent file operations summary

### User Notes:
- Include $ARGUMENTS if provided
- Otherwise, summarize recent significant actions

### Update Format:
```markdown
### Update - HH:MM

**Changes**: [git status summary or "No git changes"]
**Tasks**: [completed X, in progress Y, pending Z]
**Actions**: [summary of recent operations]

[User notes or auto-generated summary]

---
```

## Smart Features:
- If tasks in `docs/tasks/active/` were completed, suggest moving them
- If significant progress made, remind about committing
- If session is over 4 hours old, suggest ending and starting fresh

Keep updates concise but informative for future context.