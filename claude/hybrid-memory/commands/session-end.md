End the current session with a comprehensive summary. Can be called with just `/end`.

## Usage:
- `/end` - End session with automatic summary
- `/session-end` - Full command name

## Steps:
1. Check `.claude/sessions/.current-session` for active session
2. If no session, inform user there's nothing to end
3. Generate comprehensive summary:

### Summary Sections:

#### Session Overview
- Duration (start to end time)
- Working directory
- Main accomplishment (1-2 sentences)

#### Work Completed
- Git changes:
  - Files created: [list]
  - Files modified: [list]  
  - Files deleted: [list]
  - Commits made: [list with messages]
- Tasks completed (from todos and docs/tasks/)
- Features/functionality added
- Bugs fixed
- Documentation updates

#### Technical Details
- Dependencies added/updated
- Configuration changes
- Breaking changes
- Database/schema modifications
- API changes

#### Session Insights
- Problems encountered & solutions
- Decisions made & rationale
- Performance improvements
- Security considerations
- Technical debt created/addressed

#### Next Session
- Incomplete tasks
- Recommended next steps
- Items needing attention
- Potential issues to watch

### Post-Summary Actions:
1. Clear `.claude/sessions/.current-session`
2. If project has `docs/tasks/`:
   - Move completed tasks to `completed/`
   - Update task files with session notes
3. If significant work done without commits:
   - Suggest creating a commit
4. Show session file location for future reference

## Summary Template:
```markdown
## Session Summary - YYYY-MM-DD HH:MM

**Duration**: X hours Y minutes
**Result**: [one line summary of what was accomplished]

### Completed Work
[Detailed list of everything done]

### Key Changes
[Important modifications that affect the project]

### For Next Time
[What should be tackled in the next session]

---
Session saved to: .claude/sessions/[filename]
```