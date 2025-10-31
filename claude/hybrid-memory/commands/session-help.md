Show help for the memory system commands.

## Core Commands (Most Used):

### Session Management:
- `/session-start [name]` - Start a new work session
- `/session` - Update current session (auto-detects changes)
- `/end` - End session with summary
- `/status` - Check current session status

### Shortcuts:
Most commands have short versions:
- `/session` → `/session-update`
- `/end` → `/session-end`
- `/status` → `/session-status`
- `/tasks` → `/update-tasks`

## Project Commands (Optional):

### For Complex Projects:
- `/init-project` - Create project docs structure
- `/update-tasks` - Organize task files
- `/tasks` - Short version of update-tasks

## How Memory Works:

### 1. Sessions (Temporal Memory):
- Track daily work progress
- Capture git changes and decisions
- Create summaries for context
- Located in `.claude/sessions/`

### 2. Project Docs (Persistent Memory):
- Optional for complex projects
- Track tasks and documentation
- Maintain project knowledge
- Located in `docs/`

## Typical Workflows:

### Simple Work Session:
```
1. /session-start coding
2. [do work]
3. /session "fixed auth bug"
4. [more work]
5. /end
```

### Project with Tasks:
```
1. /init-project (first time only)
2. /session-start feature-x
3. [implement feature]
4. /session
5. /tasks (updates task files)
6. /end
```

### Quick Status Check:
```
/status - Shows everything at a glance
```

## Smart Features:
- Auto-detects project type
- Tracks git changes automatically
- Integrates with TodoWrite tool
- Suggests next actions
- Reminds about commits

## Tips:
- Use `/session` frequently (it's smart about what to track)
- `/end` gives you a complete summary
- `/init-project` only for complex work
- Commands work from any directory

## File Locations:
- Sessions: `.claude/sessions/`
- Current session: `.claude/sessions/.current-session`
- Project docs: `docs/` (if initialized)
- Task tracking: `docs/tasks/`