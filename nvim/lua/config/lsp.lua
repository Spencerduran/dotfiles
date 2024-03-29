---- Mappings.
---- See `:help vim.diagnostic.*` for documentation on any of the below functions
--local opts = { noremap = true, silent = true }
--vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
--vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
--vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
--vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
--
---- Use an on_attach function to only map the following keys
---- after the language server attaches to the current buffer
--local on_attach = function(client, bufnr)
--    -- Enable completion triggered by <c-x><c-o>
--    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
--
--    -- Mappings.
--    -- See `:help vim.lsp.*` for documentation on any of the below functions
--    local bufopts = { noremap = true, silent = true, buffer = bufnr }
--    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
--    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
--    vim.keymap.set('n', '<leader>k', vim.lsp.buf.hover, bufopts)
--    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
--    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
--    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
--    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
--    vim.keymap.set('n', '<leader>wl', function()
--        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--    end, bufopts)
--    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
--    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
--    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
--    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
--    vim.keymap.set('n', 'ff', function() vim.lsp.buf.format { async = true } end, bufopts)
--end
local lsp = require('lsp-zero').preset({
  name = 'minimal',
  set_lsp_keymaps = true,
  manage_nvim_cmp = true,
  suggest_lsp_servers = true,
})
lsp.set_sign_icons({
  error = '✘',
  warn = '▲',
  hint = '⚑',
  info = '»'
})
-- When you don't have mason.nvim installed
-- You'll need to list the servers installed in your system
--lsp.setup_servers({'tsserver', 'eslint'})

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = false,
  float = true,
})
