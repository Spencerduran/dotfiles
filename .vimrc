" Don't try to be vi compatible
set nocompatible
"Helps force plugins to load correctly when it is turned back on below
filetype off
"---------------------------------VUNDLE-------------------------------
"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" The following are examples of different formats supported.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.

" My Plugins
Plugin 'rbgrouleff/bclose.vim'
"Plugin 'elzr/vim-json'
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

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"---------------------------------------------------------------------------------------------------
let mapleader=" "
"Use files command for fzf/ripgrep
nnoremap <C-p> :Files<Cr>

set t_Co=256
set shell=bash
let g:indentLine_setConceal = 0

"ranger-vim settings
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

"vimfiler
	" Custom options.
	call vimfiler#custom#profile(
		\ 'default',
		\ 'context',
		\ {
		\	'explorer': 1,
		\	'find': 0,
		\	'safe': 0,
		\	'split': 0,
		\	'status': 0,
		\	'toggle': 1,
		\	'winwidth': 35
		\ }
	\ )


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
set conceallevel=0
set incsearch
set ignorecase
set smartcase
set showmatch
"set foldmarker=[,]
set foldmethod=syntax

set foldlevel=4
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
map <leader><space> :let @/=''<cr> " clear search
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
