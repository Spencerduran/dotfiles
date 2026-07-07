# Global Context

## Feature Development Workflow
For any new feature, significant behavior change, or indicator variant: invoke `superpowers:brainstorming` before writing any code. That skill chains automatically into `superpowers:writing-plans`, which produces a spec + plan. Execute the plan with `/superpowers:subagent-driven-development`. Do not enter plan mode for the brainstorming or writing-plans steps — plan mode is for reviewing code diffs inside execution, not for design.

For non-trivial code changes (anything beyond a simple one-liner), invoke the `karpathy-guidelines` skill before writing code.

## User
- Name: Spencer Duran
- Editor: neovim
- Shell: fish (not bash/zsh — write fish syntax for shell stuff)
- Terminal: Alacritty
- OS: macOS

## Obsidian Vault (Second Brain)
An Obsidian MCP server connects to `~/vaults/mind_forge`. Use MCP tools (read-note, create-note, edit-note, search-vault) for notes and tasks. Full vault structure and conventions are in that project's CLAUDE.md.

## Dotfiles
- Repo: `~/repos/dotfiles`
- Manages: fish, neovim, hammerspoon, alacritty, tmux
- Fish functions go in `fish/functions/` as individual `.fish` files
- Commit messages: keep simple (e.g., "dotfilescommit")

## Session Memory
- VAULT_DIR is ~/vaults/claude_memory — dedicated vault for Claude session history
- Full session exports: ~/vaults/claude_memory/Claude-Sessions/
- QMD-indexed extracts: ~/vaults/claude_memory/Notes/Projects/claude-sessions-qmd/
- QMD collections: `sessions` (session extracts), `notes` (second_brain vault)
- Use /recall for temporal queries (yesterday, last week) or topic search
- Use /sync-claude-sessions to export, resume, annotate sessions
- second_brain vault is read-only for Claude — search via QMD but don't write to it

## Context Management

Context is your most important resource. Proactively use subagents (Agent tool) to keep exploration, research, and verbose operations out of the main conversation.

**Default to spawning agents for:**
- Codebase exploration (reading 3+ files to answer a question)
- Research tasks (web searches, doc lookups, investigating how something works)
- Code review or analysis (produces verbose output)
- Any investigation where only the summary matters

**Stay in main context for:**
- Direct file edits the user requested
- Short, targeted reads (1-2 files)
- Conversations requiring back-and-forth
- Tasks where user needs intermediate steps

**Rule of thumb:** If a task will read more than ~3 files or produce output the user doesn't need to see verbatim, delegate it to a subagent and return a summary.

## Preferences
- Keep responses concise
- Don't over-engineer — minimal changes, no unnecessary abstractions
- No emojis unless asked
- When creating shell scripts or functions, use fish syntax
- Prefer editing existing files over creating new ones
- **Code navigation**: Prefer the LSP tool (go-to-definition, find-references, diagnostics) over grep/ripgrep for finding symbols, tracing call hierarchies, and locating definitions. Fall back to Grep (ripgrep) for text/pattern searches where LSP doesn't apply.

## CocoIndex (Semantic Code Search)
The `cocoindex-code` MCP server provides semantic code search via a `search` tool. It uses AST-based indexing with local embeddings to find code by meaning, not just text matching.

**Use cocoindex `search` instead of Grep/Glob when:**
- Exploring an unfamiliar codebase and you don't know exact names (e.g., "find authentication logic", "where are database connections configured")
- A keyword search would miss relevant results because the code uses different terminology
- You need to understand how a concept is implemented across multiple files

**Still use Grep/Glob/LSP when:**
- You know the exact symbol name, string, or pattern
- You need precise text matching (regex, literal strings)
- You're doing go-to-definition or find-references on a known symbol

## Lightpanda (Headless Browser)

The `lightpanda` MCP server is a lightweight headless browser for fetching JavaScript-rendered pages. Use it instead of WebFetch when the target is a JS-heavy site that WebFetch/defuddle can't extract content from.

**Always use lightpanda for:**
- Twitter / X (x.com, twitter.com) — tweets, threads, profiles
- Any page that returns empty or broken content via WebFetch

**Tools:** `mcp__lightpanda__goto` to navigate, `mcp__lightpanda__markdown` to extract readable content.

## Writing Standards
Invoke the `stop-slop` skill before writing any prose — notes, annotations, docs, messages.

## Browser Harness
For browser automation, read `~/Developer/browser-harness/SKILL.md` before starting.
