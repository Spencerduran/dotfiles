Update project task documentation based on current progress.

## Usage:
- `/update-tasks` - Automatically organize tasks based on session work
- `/tasks` - Short alias

## What It Does:

### 1. Review Current State:
- Check all tasks in `docs/tasks/active/`
- Review TodoWrite tool for completed items
- Analyze recent file changes
- Check session notes for progress

### 2. Automatic Task Management:
- Move completed tasks to `completed/` with completion date
- Re-number active tasks if needed
- Create new task files for discovered work
- Update task checkboxes based on progress

### 3. Task File Updates:
For each task file, update:
- ✅ Completed action items
- 🚧 In-progress items with notes
- 📝 New subtasks discovered during work
- ⚠️ Blockers or issues found

### 4. Smart Detection:
- If bug fixed: mark relevant task complete
- If feature added: update implementation tasks
- If new issues found: create backlog items
- If dependencies changed: update setup tasks

## Task Movement Rules:
- **To Completed**: All checkboxes checked
- **To Active**: From backlog if dependencies met
- **To Backlog**: New issues or deferred work
- **Priority Adjust**: Based on blockers/dependencies

## Output Example:
```
📋 Task Update Summary:
✅ Moved to completed: (2)
  - 01-user-authentication.md
  - 02-database-setup.md
  
📝 Updated active tasks: (1)
  - 01-api-endpoints.md (3/5 complete)
  
🆕 Created new tasks: (1)
  - backlog/performance-optimization.md

Current active tasks: 3
Next priority: 01-payment-integration.md
```

## Integration with Sessions:
- Automatically called during `/end` if tasks exist
- Can be run independently anytime
- Updates included in session summaries
- Links task progress to session work

## Note:
Only works if `docs/tasks/` exists. Run `/init-project` first if you need task tracking.