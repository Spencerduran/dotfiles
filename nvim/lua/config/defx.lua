
--function! s:defx_keymaps() abort

--map("n", "<Leader>dw", ":%s/\\s\\+$//e<CR>", default_options)
--
--map("n" "<silent><buffer><expr> <2-LeftMouse>", "<sid>defx_toggle_tree_or_open_file()")
--map("n" "<silent><buffer><expr> <CR>", <sid>defx_toggle_tree_or_open_file()
--map("n" "<silent><buffer><expr> l",    <sid>defx_cd_or_open_file()
map("n" "<silent><buffer><expr> q",     "defx#do_action('quit')")
--map("n" "<silent><buffer><expr> .     defx#do_action('toggle_ignored_files')
--map("n" "<silent><buffer><expr> yy    defx#do_action('yank_path')
--map("n" "<silent><buffer><expr> ~     defx#do_action('cd')
--map("n" "<silent><buffer><expr><nowait> \  defx#do_action('cd', getcwd())
--map("n" "<silent><buffer><expr> h     defx#do_action('cd', ['..'])
--map("n" "<silent><buffer><expr><nowait> <Space> defx#do_action('toggle_select') . 'j'
--map("n" "<silent><buffer><expr> *      defx#do_action('toggle_select_all')
--map("n" "<silent><buffer><expr> <C-c>  defx#do_action('clear_select_all')
--map("n" "<silent><buffer><expr> <C-r>  defx#do_action('redraw')
--map("n" "<silent><buffer><expr> <C-g>  defx#do_action('print')
--map("n" "<silent><buffer><expr> K     defx#do_action('new_directory')
--map("n" "<silent><buffer><expr> N     defx#do_action('new_multiple_files')
--map("n" "<silent><buffer><expr> dd    defx#do_action('remove')
--map("n" "<silent><buffer><expr> r     defx#do_action('rename')
--map("n" "<silent><buffer><expr> !     defx#do_action('execute_command')
--map("n" "<silent><buffer><expr><nowait> c  defx#do_action('copy')
--map("n" "<silent><buffer><expr><nowait> m  defx#do_action('move')
--map("n" "<silent><buffer><expr><nowait> p  defx#do_action('paste')
--map("n" "<silent><buffer><expr> S  defx#do_action('toggle_sort', 'time')

--endfunction
--]])
