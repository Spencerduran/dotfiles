# Neovim Quick Reference

## 🎯 Essential Keybindings

### Leader Key
- **Leader**: `<Space>`

### Navigation
| Key | Action |
|-----|--------|
| `<C-h/j/k/l>` | Navigate between windows |
| `<S-h>` | Previous buffer |
| `<S-l>` | Next buffer |
| `jk` (insert) | Exit to normal mode |

### File Operations
| Key | Action |
|-----|--------|
| `<Leader>e` | Toggle file explorer (nvim-tree) |
| `<Leader>ff` | Find files (Telescope) |
| `<Leader>fg` | Live grep (Telescope) |
| `<Leader>fb` | Browse buffers (Telescope) |
| `<Leader>fh` | Help tags (Telescope) |

### LSP Functions
| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gr` | Go to references |
| `gi` | Go to implementation |
| `K` | Hover documentation |
| `<Leader>ca` | Code actions |
| `<Leader>rn` | Rename symbol |
| `<Leader>f` | Format document |

### Git Integration
| Key | Action |
|-----|--------|
| `<Leader>gg` | Open LazyGit |
| `]c` | Next git hunk |
| `[c` | Previous git hunk |
| `<Leader>hs` | Stage hunk |
| `<Leader>hr` | Reset hunk |
| `<Leader>hp` | Preview hunk |

### Utilities
| Key | Action |
|-----|--------|
| `<Leader>dw` | Delete trailing whitespace |
| `<Leader>cp` | Copy file path to clipboard |
| `<ESC>` | Clear search highlighting |
| `<F1>` | Toggle whitespace display |
| `<C-Space>` | Toggle Obsidian checkbox |

## 📦 Plugin Commands

### Lazy.nvim
```vim
:Lazy              " Open plugin manager
:Lazy sync         " Update all plugins
:Lazy install      " Install missing plugins
:Lazy clean        " Remove unused plugins
:Lazy profile      " Profile startup time
```

### Mason (LSP/Formatter Management)
```vim
:Mason             " Open Mason UI
:MasonUpdate       " Update Mason packages
:MasonInstall <package>  " Install specific package
```

### Telescope
```vim
:Telescope         " Open Telescope
:Telescope oldfiles     " Recent files
:Telescope live_grep    " Search in files
:Telescope git_status   " Git changed files
:Telescope diagnostics  " LSP diagnostics
```

### Conform (Formatting)
```vim
:ConformInfo       " Show active formatters
:Format            " Format current buffer
```

### Trouble (Diagnostics)
```vim
:Trouble           " Toggle trouble list
:Trouble diagnostics    " Show diagnostics
:Trouble lsp_references " Show references
```

## 🛠️ Common Tasks

### Install a New LSP Server
1. Open Mason: `:Mason`
2. Search for server with `/`
3. Install with `i`
4. Configure in `lua/custom_script/plugins/lsp/lspconfig.lua`

### Add a New Formatter
1. Install formatter via Mason
2. Edit `lua/custom_script/plugins/lsp/formatter.lua`
3. Add filetype configuration to `formatters_by_ft`

### Create a New Plugin Configuration
1. Create file: `lua/custom_script/plugins/[plugin-name].lua`
2. Add plugin spec with lazy.nvim format
3. Restart Neovim or run `:Lazy sync`

### Update All Plugins
```bash
nvim --headless "+Lazy! sync" +qa
```

## 🔧 Debugging Tips

### Check Plugin Load Status
```vim
:Lazy profile      " See startup times
:checkhealth       " General health check
:checkhealth telescope  " Check specific plugin
```

### LSP Troubleshooting
```vim
:LspInfo           " Show attached LSP clients
:LspLog            " View LSP log file
:lua vim.lsp.buf.hover()  " Manual hover
```

### View Keymaps
```vim
:Telescope keymaps " Browse all keymaps
:map <key>         " Check specific key mapping
:verbose map <key> " Show where mapping was defined
```

## 💡 Tips & Tricks

### Performance
- Lazy.nvim automatically lazy-loads plugins
- Use `:Lazy profile` to identify slow plugins
- Format on save is enabled by default

### File Navigation
- Use `<C-6>` to toggle between last two buffers
- `:e #` opens the alternate file
- `gf` opens file under cursor

### Search & Replace
- `:%s/old/new/g` - Replace in entire file
- `:s/old/new/g` - Replace in current line
- Use `\c` for case-insensitive search

### Window Management
- `<C-w>s` - Split horizontally
- `<C-w>v` - Split vertically
- `<C-w>q` - Close window
- `<C-w>=` - Equal size windows

## 📋 Environment Variables

```bash
# Set in fish/config.fish
export EDITOR="nvim"
export VISUAL="nvim"
```

## 🔗 Useful Resources

- [Neovim Docs](https://neovim.io/doc/)
- [lazy.nvim](https://github.com/folke/lazy.nvim)
- [LSP Config Wiki](https://github.com/neovim/nvim-lspconfig/wiki)

---

*Use `:help` in Neovim for built-in documentation*