
vim.cmd([[
function! s:defx_keymaps() abort
  " double click/Enter/l to open file
  nnoremap <silent><buffer><expr> <2-LeftMouse> <sid>defx_toggle_tree_or_open_file()
  nnoremap <silent><buffer><expr> <CR> <sid>defx_toggle_tree_or_open_file()
  nnoremap <silent><buffer><expr> l    <sid>defx_cd_or_open_file()

  nnoremap <silent><buffer><expr> q     defx#do_action('quit')
  nnoremap <silent><buffer><expr> .     defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> yy    defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> ~     defx#do_action('cd')
  nnoremap <silent><buffer><expr><nowait> \  defx#do_action('cd', getcwd())
  nnoremap <silent><buffer><expr> h     defx#do_action('cd', ['..'])

  nnoremap <silent><buffer><expr><nowait> <Space> defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> *      defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> <C-c>  defx#do_action('clear_select_all')
  nnoremap <silent><buffer><expr> <C-r>  defx#do_action('redraw')
  nnoremap <silent><buffer><expr> <C-g>  defx#do_action('print')

  nnoremap <silent><buffer><expr> K     defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N     defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> dd    defx#do_action('remove')
  nnoremap <silent><buffer><expr> r     defx#do_action('rename')
  nnoremap <silent><buffer><expr> !     defx#do_action('execute_command')
  nnoremap <silent><buffer><expr><nowait> c  defx#do_action('copy')
  nnoremap <silent><buffer><expr><nowait> m  defx#do_action('move')
  nnoremap <silent><buffer><expr><nowait> p  defx#do_action('paste')

  nnoremap <silent><buffer><expr> S  defx#do_action('toggle_sort', 'time')
endfunction
]])
