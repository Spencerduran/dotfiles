# CLAUDE.md - Neovim Configuration

This file provides guidance to Claude Code when working with this Neovim configuration.

## Project Overview

This is a modular, Lua-based Neovim configuration using lazy.nvim as the plugin manager. The configuration emphasizes developer productivity with extensive LSP support, auto-formatting, and custom keybindings.

## Architecture

### Entry Point
- `init.lua` - Loads `custom_script.core` and `custom_script.lazy`

### Core Structure
```
lua/custom_script/
├── core/           # Core Neovim settings
│   ├── autocmds.lua    # Auto commands
│   ├── functions.lua   # Utility functions  
│   ├── globals.lua     # Global variables
│   ├── keymaps.lua     # Key mappings
│   ├── options.lua     # Neovim options
│   └── user_conf.lua   # User preferences
├── lazy.lua        # Plugin manager bootstrap
└── plugins/        # Plugin configurations
    ├── lsp/        # LSP and formatting
    └── *.lua       # Individual plugin specs
```

## Key Features

### Plugin Management
- **lazy.nvim** - Automatic lazy-loading for fast startup
- **mason.nvim** - Auto-install LSP servers and formatters
- **conform.nvim** - Format on save with per-language formatters

### Configured Languages
- JavaScript/TypeScript (prettier, tsserver)
- Python (black + isort, pyright)
- Lua (stylua, lua_ls)
- SQL (sql_formatter)
- Shell (shfmt, bashls)

### UI Enhancements
- **Colorscheme**: Custom cyberpunk theme
- **Dashboard**: Alpha with custom ASCII art headers
- **File Explorer**: nvim-tree
- **Fuzzy Finder**: Telescope
- **Status Line**: lualine
- **Buffer Line**: bufferline

## Important Keybindings

- **Leader**: `<Space>`
- **Exit Insert**: `jk`
- **File Explorer**: `<Leader>e`
- **Find Files**: `<Leader>ff`
- **Format**: `<Leader>f`
- **LazyGit**: `<Leader>gg`

## Development Workflow

### Adding New Plugins
1. Create new file in `lua/custom_script/plugins/`
2. Use lazy.nvim plugin spec format
3. Include configuration in the return table

### Adding Language Support
1. Install LSP server via Mason (`:Mason`)
2. Configure in `lua/custom_script/plugins/lsp/lspconfig.lua`
3. Add formatter in `lua/custom_script/plugins/lsp/formatter.lua`

### Debugging Issues
- Check health: `:checkhealth`
- View LSP status: `:LspInfo`
- Profile startup: `:Lazy profile`
- Check keymaps: `:Telescope keymaps`

## Project Documentation

Documentation is maintained in `nvim/docs/`:
- `README.md` - Project overview and status
- `quick-reference.md` - Commands and keybindings
- `tasks/` - Active, backlog, and completed tasks

## Common Tasks

### Update Plugins
```vim
:Lazy sync
```

### Install New LSP Server
```vim
:Mason
" Search with /
" Install with i
```

### Check Formatter Status
```vim
:ConformInfo
```

## Notes for Claude

- This configuration is actively used and frequently modified
- Prefer editing existing files over creating new ones
- Follow the existing plugin structure when adding features
- Test changes by restarting Neovim or `:Lazy reload`
- Format-on-save is enabled - ensure formatters are configured
- Custom ASCII art headers are in `lua/custom_script/plugins/header_img/`

## Recent Changes

- 2025-08-11: Initialized project documentation structure
- Added comprehensive README and quick-reference guide
- Set up task tracking system for improvements

---

*This file helps Claude Code understand and work with this Neovim configuration effectively.*