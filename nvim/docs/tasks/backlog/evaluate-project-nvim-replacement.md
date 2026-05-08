# Evaluate project.nvim Replacement

## Summary
`project.nvim` is unmaintained. Applied a one-line patch for the `buf_get_clients`
deprecation warning, but swap the plugin before the next `:Lazy update` wipes it.

## Candidates

- **`natecraddock/workspaces.nvim`**: explicit workspace list with a Telescope picker.
  Covers both auto-chdir and `<leader>fp` / `<leader>sp` switching in one plugin.
- **`echasnovski/mini.misc`** (`setup_auto_root()`): just the auto-chdir piece.
  Use alongside `telescope-project.nvim` if you still want a picker.
- **`nvim-telescope/telescope-project.nvim`**: Telescope picker only, no project.nvim
  dependency.

## Current Patch
`~/.local/share/nvim/lazy/project.nvim/lua/project_nvim/project.lua:16`
```lua
-- was: vim.lsp.buf_get_clients()
local clients = vim.lsp.get_clients({ bufnr = 0 })
```

## Action Items
- [ ] Test `workspaces.nvim` + `mini.misc` as replacement
- [ ] Verify `<leader>fp` / `<leader>sp` Telescope pickers still work after swap
- [ ] Remove or reimplement `ProjectAddManually` for the new plugin
- [ ] Update which-key entries if picker command changes
