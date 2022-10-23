vim.api.nvim_set_var('vimwiki_global_ext', 0)
vim.cmd([[
let g:vimwiki_list = [{'path': '/Users/spencerduran/VimWiki', 'syntax': 'markdown'}]
let g:vimwiki_table_mappings = 0 "avoid conflict with auto complete
let g:vimwiki_conceal_pre =1
let g:vimwiki_autowriteall =1
]])
