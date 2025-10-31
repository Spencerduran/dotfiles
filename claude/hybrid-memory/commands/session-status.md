Show current session status and recent activity. Can be called with just `/status`.

## Usage:
- `/status` - Show session status
- `/session-status` - Full command name

## Information Displayed:

### If Session Active:
1. Session name and start time
2. Duration so far
3. Current goals
4. Progress summary:
   - Number of updates made
   - Files changed (count)
   - Tasks completed/in-progress
   - Last update timestamp

### If No Session:
1. Show last 3 sessions with:
   - Name, date, duration
   - Main accomplishment
   - Files changed count

2. Suggest starting a session with `/session-start`

### Always Show:
- Current directory
- Git status (branch, uncommitted changes)
- Active tasks count (if docs/tasks/ exists)
- Any incomplete todos from TodoWrite tool

## Quick Status Format:
```
📍 Current Session: [name] (2h 15m)
📂 Directory: /path/to/project
🌿 Branch: main (5 uncommitted changes)
✅ Progress: 3 tasks done, 2 in progress
🕐 Last update: 15 minutes ago

Need to update? Use: /session
Ready to end? Use: /end
```

## Intelligent Reminders:
- If session > 4 hours: suggest taking a break or ending session
- If many uncommitted changes: suggest updating session notes
- If tasks completed: suggest moving them to completed/
- If no recent updates: remind to document progress