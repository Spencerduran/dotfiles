call defx#custom#column('mark', {
      \ 'readonly_icon': '',
      \ 'selected_icon': '✓',
      \ })

call defx#custom#column('filename', {
      \ 'min_width': 40,
      \ 'max_width': 50,
      \ })

call defx#custom#column('time', {
      \ 'format': '%Y %b %e %H:%M:%S',
      \ })

function! s:defx_toggle_tree_or_open_file() abort
  if defx#is_directory()
    return defx#do_action('open_or_close_tree')
  else
    return defx#do_action('open')
  endif
endfunction

function! s:defx_cd_or_open_file() abort
  if defx#is_directory()
    return defx#do_action('open_directory')
  else
    return defx#do_action('open')
  endif
endfunction

function! s:defx_keymaps() abort
-- double click/Enter/l to open file
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

function! s:browse() abort
  let l:path = expand('<amatch>')
  if l:path ==# '' || bufnr('%') != expand('<abuf>')
    return
  endif
  if &filetype ==# 'defx' && line('$') != 1
    return
  endif
  if !isdirectory(l:path)
    return
  endif
  bd
  exe ':Defx -show-ignored-files -split=no -columns=mark:indent:icons:filename:type:size:time ' . l:path
endfunction

-- disable netrw.
augroup FileExplorer
  autocmd!
augroup END
augroup defx_group
  autocmd!
  -- Move focus to the next window if current buffer is defx
  autocmd TabLeave * if &ft ==# 'defx' | wincmd w | endif
  -- keymap
  autocmd FileType defx do WinEnter | call s:defx_keymaps()
  -- replace netrw to defx
  autocmd BufEnter * call s:browse()
augroup END

map <C-e> :Defx -split=no -columns=mark:indent:icons:filename:type:size:time<CR>

augroup defx
    au!
    au VimEnter * sil! au! FileExplorer *
    au BufEnter * if s:isdir(expand('%')) | bd | exe 'Defx' | endif
augroup END

fu! s:isdir(dir) abort
    return !empty(a:dir) && (isdirectory(a:dir) ||
       \ (!empty($SYSTEMDRIVE) && isdirectory('/'.tolower($SYSTEMDRIVE[0]).a:dir)))
endfu
