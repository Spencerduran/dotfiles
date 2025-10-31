Initialize project documentation structure for complex projects that need persistent memory.

## When to Use:
- Starting a new significant project
- Working on existing project that needs better organization
- Multiple features/tasks to track
- Team collaboration or handoff expected

## What It Creates:

### Minimal Structure (default):
```
docs/
├── README.md           # Project overview with current status
├── tasks/
│   ├── active/        # Current priority tasks (numbered)
│   ├── backlog/       # Future tasks
│   └── completed/     # Finished work archive
└── quick-reference.md  # Commands, URLs, common fixes
```

### Optional Full Structure (with --full flag):
Adds:
- `docs/architecture.md` - Technical design decisions
- `docs/setup-guide.md` - Getting started instructions
- `docs/troubleshooting.md` - Known issues & solutions

## Created Files Content:

### docs/README.md:
- Project name and description
- Current status with checkmarks
- Links to tasks and documentation
- Quick start commands

### docs/tasks/ Structure:
- Active tasks numbered by priority (01-, 02-, etc.)
- Each task file has:
  - Summary (2-3 sentences)
  - Action items (checkboxes)
  - Technical context
- Backlog for unscheduled work
- Completed archive for reference

### docs/quick-reference.md:
- Frequently used commands
- Important URLs/endpoints
- Environment variables
- Common error fixes

## Smart Detection:
1. Detect project type from files:
   - Node.js: package.json
   - Python: requirements.txt, pyproject.toml
   - Ruby: Gemfile
   - Go: go.mod
   - Rust: Cargo.toml

2. Add relevant sections based on detection:
   - Test commands
   - Build/deploy steps
   - Development server setup
   - Dependency management

3. Extract existing information:
   - Read README if exists
   - Check for existing docs/
   - Preserve any existing documentation

## Usage:
- `/init-project` - Create minimal structure
- `/init-project --full` - Create complete structure
- `/init-project [project-name]` - Set specific project name

## After Creation:
- Automatically starts a session if none active
- Adds first task to active/ if user has immediate work
- Shows user the quick-reference for available commands

Note: This is optional! Simple projects don't need this structure. Use it when you need persistent task tracking and documentation.