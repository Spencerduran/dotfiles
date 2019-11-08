set encoding=utf8
" Set Truecolors
if has("termguicolors")
  set termguicolors
endif

if (empty($TMUX))
  if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

let g:indentLine_setConceal = 0
set nofoldenable
set foldmethod=indent
set foldlevel=20
"let g:spacevim_guifont = 'Hack Nerd Font:h14'
let g:spacevim_guifont = 'Iosevka Nerd Font Complete Mono:h16'
"set guifont=Hack Nerd Font:h14
" Set window size
if has("gui_running")
  set lines=100 columns=250
  set transparency=3
endif

" add custom plugins.
let g:spacevim_custom_plugins = [
 \ ['ntpeters/vim-better-whitespace', {'merged': 0}],
 \ ['vim-syntastic/syntastic', {'merged': 0}],
 \ ['Yggdroot/indentLine', {'merged': 0}],
 \ ['dracula/vim', {'merged': 0}],
 \ ['ryanoasis/vim-devicons'],
 \ ['godlygeek/tabular'],
 \ ['srcery-colors/srcery-vim'],
 \ ['pangloss/vim-javascript', {'merged' : 0}],
 \ ['francoiscabrol/ranger.vim', {'merged' : 0}],
 \ ['terryma/vim-multiple-cursors', {'merged' : 0}],
 \]
" loaded ui layer
call SpaceVim#layers#load('ui')
call SpaceVim#layers#load('ctrlp')
call SpaceVim#layers#disable('core#statusline')
call SpaceVim#layers#disable('core#tabline')
call SpaceVim#layers#disable('autocomplete')

"Colorscheme
 set t_Co=256
"let g:spacevim_colorscheme = "gruvbox"
"let g:spacevim_colorscheme = "dracula"
let g:spacevim_colorscheme_bg = 'dark'
hi Comment cterm=italic

" Highlight/Underline trailing whitespace
autocmd ColorScheme * hi ExtraWhitespace guifg=#FF2626 gui=underline ctermfg=198 cterm=underline

" Trim whitespace on save
let g:strip_whitespace_on_save = 1

" Enable Syntax checking
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go', 'ruby', 'javascript'] }
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_scss_checkers = ['compass']

" syntastic config
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Space/Tab settings
set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set autoindent

" Ag for fast file search
if executable('ag')
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command =
    \ 'ag %s --files-with-matches -g "" --ignore "\.git$\|\.hg$\|\.svn$"'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
else
  " Fall back to using git ls-files if Ag is not available
  let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']
endif

" Set default working folder
cd ~/repos

"VimFiler
let g:spacevim_enable_vimfiler_welcome = 0
let g:vimfiler_ignore_pattern = '^\%(\.git\|\.DS_Store\)$'

" Change leader to ,
let mapleader = ","

" SpecialKey highlight
" autocmd ColorScheme * hi SpecialKey term=bold ctermfg=16 guifg=#09AA08

" ChooseWin plugin setting
nmap  -  <Plug>(choosewin)
let g:choosewin_overlay_enable = 1

let g:deoplete#auto_complete_delay = 150

let g:webdevicons_enable = 1
let g:spacevim_enable_tabline_filetype_icon = 1
let g:spacevim_enable_os_fileformat_icon = 1
let g:webdevicons_enable_vimfiler = 1
let g:webdevicons_enable_airline_statusline = 1

let g:ctrlp_working_path_mode = 'ra'

set shell=bash
"set shell=/bin/bash

if $TERM_PROGRAM == 'Apple_Terminal'
  let g:spacevim_enable_guicolors = 1
endif

let g:spacevim_statusline_unicode_symbols = 1
let g:spacevim_windows_index_type = 3
let g:spacevim_buffer_index_type = 4

let g:indent_guides_enable_on_vim_startup = 1

" Softwrap
set wrap linebreak nolist

" Indentation guides on tabs
set list lcs=tab:\┆\
set list

" Searching
""/let g:vimfiler_tree_leaf_icon
""/let g:vimfiler_force_overwrite_statusline
""/let g:vimfiler_extensions
nnoremap ; :
nnoremap / /\v
vnoremap / /\v
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
nnoremap vd :VimFiler<Enter>
nnoremap / /\v
nnoremap ; :
set clipboard=unnamed
set conceallevel=0
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
" Last line
set showmode
set showcmd

"VIMFILER
"" Global options definition.
let g:vimfiler_directory_display_top =
      \ get(g:, 'vimfiler_directory_display_top', 1)
let g:vimfiler_max_directories_history =
      \ get(g:, 'vimfiler_max_directories_history', 50)
let g:vimfiler_safe_mode_by_default =
      \ get(g:, 'vimfiler_safe_mode_by_default', 1)
let g:vimfiler_force_overwrite_statusline =
      \ get(g:, 'vimfiler_force_overwrite_statusline', 1)
let g:vimfiler_time_format =
      \ get(g:, 'vimfiler_time_format', '%y/%m/%d %H:%M')
let g:vimfiler_tree_leaf_icon =
      \ get(g:, 'vimfiler_tree_leaf_icon', '|')
let g:vimfiler_tree_opened_icon =
      \ get(g:, 'vimfiler_tree_opened_icon', '-')
let g:vimfiler_tree_closed_icon =
      \ get(g:, 'vimfiler_tree_closed_icon', '+')
let g:vimfiler_tree_indentation =
      \ get(g:, 'vimfiler_tree_indentation', 1)
let g:vimfiler_file_icon =
      \ get(g:, 'vimfiler_file_icon', ' ')
let g:vimfiler_readonly_file_icon =
      \ get(g:, 'vimfiler_readonly_file_icon', 'X')
let g:vimfiler_marked_file_icon =
      \ get(g:, 'vimfiler_marked_file_icon', '*')
let g:vimfiler_quick_look_command =
      \ get(g:, 'vimfiler_quick_look_command', '')
let g:vimfiler_ignore_pattern =
      \ get(g:, 'vimfiler_ignore_pattern', ['^\.'])
let g:vimfiler_expand_jump_to_first_child =
      \ get(g:, 'vimfiler_expand_jump_to_first_child', 1)
let g:vimfiler_restore_alternate_file =
      \ get(g:, 'vimfiler_restore_alternate_file', 1)
let g:vimfiler_ignore_filters =
      \ get(g:, 'vimfiler_ignore_filters', ['matcher_ignore_pattern'])

let g:vimfiler_execute_file_list =
      \ get(g:, 'vimfiler_execute_file_list', {})

