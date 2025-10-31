# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository containing configuration for various development tools and environments on macOS. The repository is actively maintained with uncommitted changes frequently present.

## Key Configurations

### Fish Shell
- Main config: `fish/config.fish` - Sets up environment variables, PATH, and tools like pyenv, fzf
- Custom functions in `fish/functions/` - Contains numerous utility functions for development workflows
- Key environment setup:
  - Editor: `nvim`
  - FZF configured with ripgrep for file searching
  - Homebrew, pyenv, pipx, and spicetify paths configured

### Neovim Configuration
- Architecture: Modular Lua-based configuration using lazy.nvim package manager
- Entry point: `nvim/init.lua` → loads `custom_script.core` and `custom_script.lazy`
- Plugin structure:
  - Core modules in `nvim/lua/custom_script/core/`
  - Plugins in `nvim/lua/custom_script/plugins/`
  - LSP configuration in `nvim/lua/custom_script/plugins/lsp/`
- Formatter: Uses conform.nvim with format-on-save enabled
  - JavaScript/TypeScript: prettier
  - Python: isort + black
  - Lua: stylua
  - SQL: sql_formatter
  - Shell: shfmt

### Hammerspoon
- Window management and automation for macOS
- Hyper key implementation (F18/Capslock as modifier)
- Quick app switching including special handler for Claude app (2x ctrl press)

### Other Tools
- Alacritty terminal configuration
- Tmux configuration
- Spicetify themes for Spotify customization
- VSCode settings
- Ranger file manager with custom plugins

## Common Commands

### NinjaStrat Website Deployment
```fish
rebuild  # Builds and deploys the NinjaStrat website to GitHub Pages
```
This function (defined in `fish/functions/rebuild.fish`):
1. Changes to `/Users/spencerduran/Code_Repos/ninjastrat_website`
2. Runs `npm run build`
3. Copies output to docs folder
4. Commits and pushes to GitHub

### Git Workflow Functions
- `gitclean` - Clean up git branches
- `gitmerged` - Show merged branches
- `gitcleanremote` - Clean remote branches
- `merge_develop` - Merge develop branch
- `develop_status` - Check develop branch status

### Python Project Templates
- `new_python_project` - Create new Python project structure
- `python_flat_project` - Create flat Python project
- `python_boilerplate` - Generate Python boilerplate code

## File Modifications

When modifying configurations:
1. **Fish functions**: New functions go in `fish/functions/` as separate `.fish` files
2. **Neovim plugins**: Add new plugin configurations in `nvim/lua/custom_script/plugins/`
3. **LSP/Formatter settings**: Modify `nvim/lua/custom_script/plugins/lsp/formatter.lua` for new language formatters

## Git Status Notes

The repository typically has uncommitted changes. Current modified files often include:
- `hammerspoon/init.lua` - Window management tweaks
- `nvim/lua/custom_script/plugins/telescope.lua` - Search configuration updates

When committing, use simple commit messages like "dotfilescommit" as seen in the history.