# Memory System Example Workflows

## 🚀 Quick Start (Minimum Commands)

The system is designed to work with just 3 commands for most workflows:

### Basic Daily Workflow
```bash
# Start your day
/session-start

# After making progress (optional - do this whenever you want)
/session

# End your session
/end
```

That's it! The system automatically tracks everything else.

---

## 📍 Real-World Examples

### Example 1: Quick Bug Fix (30 minutes)
```bash
# Start
User: "Help me fix the login bug"
Claude: "I'll help you fix that. Let me start a session to track our work."
       [Runs: /session-start login-fix]

# Work happens...
Claude: [Fixes the bug, makes changes to auth.js]
       "I've fixed the authentication issue. Let me update our session."
       [Runs: /session "Fixed race condition in auth flow"]

# End
User: "Great, that's working now"
Claude: "Perfect! Let me document what we did."
       [Runs: /end]
       
       Summary: Fixed login race condition
       - Modified: src/auth.js
       - Issue: Token refresh happening before initial auth
       - Solution: Added proper async/await handling
```

### Example 2: Feature Development (2 hours)
```bash
# Start
User: "I need to add dark mode to my app"
Claude: "I'll help implement dark mode. Starting a session."
       [Runs: /session-start dark-mode-feature]

# After initial implementation
Claude: [After adding theme context and base styles]
       [Runs: /session "Added theme context and base dark mode styles"]

# After more progress
Claude: [After updating components]
       [Runs: /session "Updated 12 components with theme support"]

# Check status
User: "How much have we done?"
Claude: [Runs: /status]
       "📍 Current Session: dark-mode-feature (1h 45m)
        ✅ Progress: Theme system created, 12 components updated
        📂 Changed: 15 files
        🕐 Last update: 5 minutes ago"

# End session
User: "Let's wrap up for now"
Claude: [Runs: /end]
       "Session Summary: Implemented dark mode feature
        - Created theme context provider
        - Added theme toggle component  
        - Updated 12 components with dark variants
        - Next: Update remaining components, add persistence"
```

### Example 3: Complex Project (Multiple Sessions)
```bash
# First time setup
User: "I'm building an e-commerce site, help me get organized"
Claude: "Let's set up project structure for better tracking."
       [Runs: /init-project ecommerce-site]
       [Runs: /session-start initial-setup]

# Work on first feature
Claude: [Creates database schema, API routes]
       [Runs: /session "Set up database and basic API"]
       [Runs: /tasks]  # Updates task documentation

# End first session
Claude: [Runs: /end]

# Next day - Continue work
User: "Let's continue with the payment integration"
Claude: [Runs: /session-start payment-integration]
       "I can see from yesterday we completed the database setup.
        Today we'll work on Stripe integration."

# During work
Claude: [Implements payment flow]
       [Runs: /session "Added Stripe checkout flow"]
       [Runs: /tasks]  # Marks payment task as complete

# End session
Claude: [Runs: /end]
```

---

## 💡 Tips for Effective Use

### When to use `/session` (update):
- After completing a significant piece of work
- When switching between different parts of the code
- Before taking a break
- When you want to document a decision or finding

### When to use `/status`:
- Starting work after a break
- Checking what's been done
- Before ending to ensure nothing missed
- When context switching between projects

### When to use `/init-project`:
- Starting a new significant project
- Working on something that will take multiple sessions
- Need to track specific tasks and documentation
- Planning to hand off work to someone else

### When to Skip Commands:
- Very quick fixes (< 10 minutes) might not need a session
- Reading/researching without making changes
- Simple questions that don't involve code changes

---

## 🎯 Command Cheat Sheet

| What you want | Command to use | When to use it |
|--------------|----------------|----------------|
| Start working | `/session-start` | Beginning any work session |
| Quick update | `/session` | After making progress |
| Check progress | `/status` | Anytime you want info |
| Finish working | `/end` | Done for now |
| Setup project | `/init-project` | First time on complex project |
| Update tasks | `/tasks` | After completing project tasks |
| Get help | `/session-help` | When you forget commands |

---

## 🔄 Typical Session Flow

```
Morning:
  ↓
/session-start → Work → /session → More work → /status
  ↓
Lunch break
  ↓  
/status → Continue work → /session → Final push
  ↓
/end → Complete summary saved

Next day:
  ↓
/status (shows last session) → /session-start → Continue...
```

---

## 🚦 System Intelligence

The system automatically:
- Detects your project type (Node, Python, etc.)
- Tracks git changes without you asking
- Integrates with Claude's todo system
- Suggests when to commit code
- Reminds about long-running sessions
- Links tasks to actual work done

You don't need to remember what to track - just use `/session` periodically and `/end` when done!