" Don't try to be vi compatible 
set nocompatible
"Helps force plugins to load correctly when it is turned back on below
filetype off
"---------------------------------VUNDLE-------------------------------
"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" My Plugins
Plugin 'tpope/vim-fugitive'
Plugin 'rbgrouleff/bclose.vim'
"Plugin 'elzr/vim-json'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'prettier/vim-prettier'
Plugin 'airblade/vim-gitgutter'
Plugin 'easymotion/vim-easymotion'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'ryanoasis/vim-devicons'
Plugin 'shougo/unite.vim'
Plugin 'shougo/vimshell.vim'
Plugin 'shougo/vimfiler.vim'
Plugin 'rstacruz/sparkup'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'mhinz/vim-startify'
Plugin 'junegunn/fzf.vim'
Plugin 'francoiscabrol/ranger.vim'
call vundle#end()            " required
filetype plugin indent on    " required
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"---------------------------------------------------------------------------------------------------

let mapleader=" "
"Use files command for fzf/ripgrep
nnoremap <C-p> :Files<Cr>
nnoremap <Leader>w :w<Cr>
set backspace=indent,eol,start
set t_Co=256
set shell=bash
set smarttab
set cindent
set tabstop=2
set shiftwidth=2

" vim-prettier
let g:prettier#quickfix_enabled = 0
let g:prettier#quickfix_auto_focus = 0
" prettier command for coc
command! -nargs=0 Prettier :CocCommand prettier.formatFile
" run prettier on save
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

" always uses spaces instead of tab characters
set expandtab

" coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ ]
" from readme
" if hidden is not set, TextEdit might fail.
set hidden " Some servers have issues with backup files, see #649 set nobackup set nowritebackup " Better display for messages set cmdheight=2 " You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)


"ranger-vim settings
" Rudimentary vimscript to use ranger as a file/directory picker
" Nelson Uhan
" 2018.9.9
"
" Uses Vim 8's terminal to open ranger in a new window
" Tested on MacVim 8.1.120, GUI and terminal versions
"
" Put this in your .vimrc (or equivalent)
" :RangerFiles opens ranger as a file picker in a new window
" :RangerDirs opens ranger as a directory picker in a new window
" Map these commands as you like

" ranger file picker
function! RangerFilePicker()
  " Temp file for Ranger selections
  let tempfile = tempname()

  " Dictionary function
  let ranger = { 'tempfile' : tempfile }

  function! ranger.OnExit(...)
    " Is temp file readable?
    if !filereadable(self.tempfile)
      return
    endif

    " Read ranger selections, delete temp file
    let selections = readfile(self.tempfile)
    call delete(self.tempfile)

    " Are there any selections?
    if empty(selections)
      return
    endif

    " Close the terminal window, edit the first item
    close
    exec 'edit ' . fnameescape(selections[0])

    " Add any remaining items to the arg/buffer list
    for sel in selections[1:]
      exec 'argadd '. fnameescape(sel)
    endfor
  endfunction

  " Open ranger in a new terminal window
  let pwd = getcwd()
  let cmd = 'ranger --choosefiles=' . fnameescape(tempfile) . ' ' . fnameescape(pwd)
  let buf = term_start(cmd, {'term_finish' : 'close', 'exit_cb' : ranger.OnExit})
endfunction
command! RangerFiles call RangerFilePicker()

" ranger directory picker
function! RangerDirPicker()
  " Temp file for Ranger selections
  let tempfile = tempname()

  " Dictionary function
  let ranger = { 'tempfile' : tempfile }

  function! ranger.OnExit(...)
    " Is temp file readable?
    if !filereadable(self.tempfile)
      return
    endif

    " Read ranger selections, delete temp file
    let selections = readfile(self.tempfile)
    call delete(self.tempfile)

    " Are there any selections?
    if empty(selections)
      return
    endif

    " Close the terminal window, change current directory
    close
    exec 'cd ' . fnameescape(selections[0])
  endfunction

  " Open ranger in a new terminal window
  let pwd = getcwd()
  let cmd = 'ranger --show-only-dirs --choosedir=' . fnameescape(tempfile) . ' ' . fnameescape(pwd)
  let buf = term_start(cmd, {'term_finish' : 'close', 'exit_cb' : ranger.OnExit})
endfunction
command! RangerDirs call RangerDirPicker()
let g:ranger_map_keys = 0
map <leader>r :Ranger<CR>

"enable fzf
set rtp+=/usr/local/opt/fzf


"gui settings
if has('gui_running')
	set guifont=HackNerdFontComplete\-Regular:h14
  	set transparency=3
	set browsedir=buffer " Use the same directory as current buffer's path when browsing files.
endif

nnoremap vf :VimFilerExplorer<Enter>
let g:loaded_netrwPlugin = 0
let g:vimfiler_expand_jump_to_first_child = 1
let g:webdevicons_enable_vimfiler = 1
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_tree_leaf_icon = " "
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
"let g:vimfiler_file_icon = '-'
let g:vimfiler_marked_file_icon = '✓'
let g:vimfiler_readonly_file_icon = '✗'
let g:vimfiler_time_format = '%m-%d-%y %H:%M:%S'
let g:vimfiler_expand_jump_to_first_child = 0
let g:vimfiler_ignore_pattern = '\.git\|\.DS_Store\|\.pyc'

"fonts
let g:airline_powerline_fonts = 1
let g:webdevicons_enable = 1
let g:spacevim_enable_tabline_filetype_icon = 1
let g:spacevim_enable_os_fileformat_icon = 1
let g:webdevicons_enable_airline_statusline = 1
"airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

set number			" Show current line number
set relativenumber		" Show relative line numbers
set clipboard=unnamed,unnamedplus " Use system clipboard.
nnoremap / /\v
nnoremap ; :
" Normal Mode
set wildmenu " Command-line completion operates in an enhanced mode.
set cmdwinheight=18 " Height of the command window size for commands like `q:` and `q/`.
set history=10000 " Define maximum command history size.
set noshowmode " Disable native mode indicator.
" Buffers
set splitbelow " Splitting a window will put the new window below of the current one.
set splitright " Splitting a window will put the new window right of the current one.
" Editor
set scrolloff=8 " Minimum number of screen lines to keep above and below the cursor.
set cursorline " Highlight the line background of the cursor.
set fillchars= " Characters to fill the status lines and vertical separators.
set clipboard=unnamed
let g:indentLine_setConceal = 0
set conceallevel=0
set incsearch
set ignorecase
set smartcase
set showmatch
"set foldmarker=[,]
set foldmethod=syntax
set foldlevel=2

" Last line
set showmode
set showcmd
:imap jj <Esc>
:imap jk <Esc>
:imap kj <Esc>
"autoread and auto save on focus change
au FocusGained,BufEnter * :silent! !
au FocusLost,WinLeave * :silent! noautocmd w

" Tab switching
map <C-t><up> :tabr<cr>
map <C-t><down> :tabl<cr>
map <C-t><left> :tabp<cr>
map <C-t><right> :tabn<cr>
" Buffer Switching 
nnoremap <Leader>bn :bn<CR>
nnoremap <Leader>bn :bn<CR>
nnoremap <Leader>bd :bd<CR>
nnoremap <Leader>ls :ls<CR>
nnoremap <Leader>bp :bp<CR>
nnoremap <Leader>g :e#<CR>
nnoremap <PageUp>   :bprevious<CR>
nnoremap <PageDown> :bnext<CR>
" Turn on syntax highlighting
set filetype=json
syntax on
"au BufRead,BufNewFile,BufReadPost *.json set syntax=json
"hi! def link jsonKeyword Identifier
" Show fIile stats set ruler
" Encoding
set encoding=UTF-8
" Allow hidden buffers
set hidden
" Rendering
set ttyfast
" Status bar
set laststatus=2
" Last line
set showmode
set showcmd
" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>
" Formatting
map <leader>q gqip
"colorscheme dracula
"colorscheme gruvbox 
"set background=dark
" Visualize tabs and newlines

set listchars=tab:▸\ ,eol:¬
"
" -- Normal Mode
" ------------------------------------------------
" Pane nagivation.
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
" Toggle fold at current position.

nnoremap <Tab> za
" Fold Text
set foldtext=FoldText() " Use custom fold text function for folds.

function! FoldText() abort
	let l:fs = v:foldstart

	while getline(l:fs) !~# '\w'
		let l:fs = nextnonblank(l:fs + 1)
	endwhile

	if l:fs > v:foldend
		let l:line = getline(v:foldstart)
	else
		let l:line = substitute(getline(l:fs), '\t', repeat(' ', &tabstop), 'g')
	endif

	return
		\ repeat(repeat(' ', 4), v:foldlevel - 1)
		\ . '> '
		\ . matchstr(l:line, '\v\w.+\s\ze\{')
endfunction

" FUGITIVE SETTINGS
" Fugitive Conflict Resolution
nnoremap <leader>gd :Gvdiff<CR>
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>>
"close all diff windows, leave active open
nnoremap <Leader>gD <c-w>h<c-w>c
