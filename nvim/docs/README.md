# Neovim Configuration

A modular, Lua-based Neovim configuration with lazy.nvim package manager and extensive customizations.

## 📍 Current Status

- [x] Core configuration (keymaps, options, autocmds)
- [x] Plugin management with lazy.nvim
- [x] LSP setup with mason.nvim
- [x] Formatter configuration with conform.nvim
- [x] Custom colorscheme (cyberpunk)
- [ ] Additional language server configurations
- [ ] Debugging setup
- [ ] Performance optimizations

## 🚀 Quick Start

```bash
# Install Neovim (if not already installed)
brew install neovim

# Clone this configuration
git clone [your-repo] ~/.config/nvim

# Start Neovim (plugins will auto-install)
nvim
```

## 📁 Project Structure

```
nvim/
├── init.lua                    # Entry point - loads core and lazy modules
├── lazy-lock.json             # Plugin version lock file
├── lua/custom_script/
│   ├── core/                 # Core Neovim configurations
│   │   ├── autocmds.lua     # Auto commands
│   │   ├── functions.lua    # Utility functions
│   │   ├── globals.lua      # Global variables
│   │   ├── keymaps.lua      # Key mappings
│   │   ├── options.lua      # Neovim options
│   │   └── user_conf.lua    # User-specific settings
│   ├── lazy.lua             # Lazy.nvim bootstrap and setup
│   └── plugins/             # Plugin configurations
│       ├── lsp/             # LSP and formatter configs
│       ├── header_img/      # Custom ASCII art headers
│       └── [plugin].lua     # Individual plugin configs
└── docs/                    # Project documentation
    ├── README.md           # This file
    ├── quick-reference.md  # Common commands and tips
    └── tasks/              # Task tracking
        ├── active/         # Current priority tasks
        ├── backlog/        # Future improvements
        └── completed/      # Finished work archive
```

## 🔧 Key Features

### Plugin Management
- **Package Manager**: lazy.nvim for fast, lazy-loading plugins
- **UI**: Alpha dashboard, bufferline, lualine statusline
- **File Management**: nvim-tree, telescope fuzzy finder
- **Git Integration**: gitsigns, lazygit integration
- **LSP**: Full LSP support with mason.nvim auto-installation
- **Completion**: nvim-cmp with multiple sources
- **Formatting**: conform.nvim with format-on-save

### Language Support
- **JavaScript/TypeScript**: prettier formatting, tsserver LSP
- **Python**: black + isort formatting, pyright LSP
- **Lua**: stylua formatting, lua_ls LSP
- **SQL**: sql_formatter
- **Shell**: shfmt formatting, bashls LSP

### Custom Features
- Cyberpunk colorscheme
- Multiple ASCII art headers for Alpha dashboard
- Tmux integration
- Obsidian integration for note-taking
- Remote SSH editing support
- Smooth cursor animations

## 📚 Documentation

- [Quick Reference](./quick-reference.md) - Common commands and keybindings
- [Tasks](./tasks/) - Current and planned improvements
- [Architecture](./architecture.md) - Technical design decisions *(coming soon)*

## 🔗 Related Links

- [Neovim](https://neovim.io/)
- [lazy.nvim](https://github.com/folke/lazy.nvim)
- [mason.nvim](https://github.com/williamboman/mason.nvim)

---

*Last updated: 2025-08-11*