#!/usr/bin/env fish
# Registers local (stdio) MCP servers with Claude Code. Safe to re-run on any machine.

claude mcp add -s user sem -- sem-mcp
claude mcp add -s user lightpanda -- lightpanda mcp
claude mcp add -s user chrome-devtools -- npx chrome-devtools-mcp@latest --autoConnect
