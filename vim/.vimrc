"-----------------------------------Vim settings--------------------------------------
let mapleader=" "
set expandtab " always uses spaces instead of tab characters
set noerrorbells
set backspace=indent,eol,start
set title " Show filename in titlebar of window
set noswapfile " Disable .swp files
set nobackup
set undodir=~/.vim/undodir
set undofile
set t_Co=256
set shell=bash
set smarttab
set smartindent
set tabstop=4 softtabstop=4
set shiftwidth=4
set number " Show current line number
set relativenumber " Show relative line numbers
set clipboard=unnamed,unnamedplus " Use system clipboard.
set listchars=tab:▸\ ,eol:¬ " Visualize tabs and newlines
set nocompatible " Don't try to be vi compatible
set shortmess+=c " don't give ins-completion-menu messages.
" Normal Mode
set wildmenu " Command-line completion operates in an enhanced mode.
set cmdwinheight=18 " Height of the command window size for commands like `q:` and `q/`.
set history=10 " Define maximum command history size.
set noshowmode " Disable native mode indicator.
" Buffers
set splitbelow " Splitting a window will put the new window below of the current one.
set splitright " Splitting a window will put the new window right of the current one.
" Editor
set scrolloff=8 " Minimum number of screen lines to keep above and below the cursor.
set cursorline " Highlight the line background of the cursor.
set fillchars= " Characters to fill the status lines and vertical separators.
set clipboard=unnamed
set conceallevel=0 " Dont hide symbols in MD and JSON
set showmatch
set foldmethod=syntax
set foldlevel=2
"fonts
let g:airline_powerline_fonts = 1
let g:webdevicons_enable = 1
let g:webdevicons_enable_airline_statusline = 1
" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>
" Last line
set showmode
set showcmd
:imap jk <Esc>
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
" Encoding
set encoding=UTF-8
" Rendering
set ttyfast
" Status bar
set laststatus=2
" Last line
set showmode
set showcmd
autocmd BufWritePre * :%s/\s\+$//e " Remove whitespace on save
colorscheme dracula
"------------------------------------Search settings---------------------
set incsearch
set hlsearch
set ignorecase
set showmatch

"------------------------------------Pane nagivation---------------------
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <leader>u :UndotreeShow<CR>

"---------------------------------VimPlug--------------------------------
call plug#begin('~/.vim/plugged')
Plug 'mbbill/undotree'
Plug 'dbakker/vim-projectroot'
Plug 'christoomey/vim-tmux-navigator'
Plug 'dracula/vim', { 'name': 'dracula' }
Plug 'tpope/vim-fugitive'
Plug 'rbgrouleff/bclose.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'airblade/vim-gitgutter'
Plug 'ryanoasis/vim-devicons'
Plug 'shougo/unite.vim'
Plug 'shougo/vimshell.vim'
Plug 'shougo/vimfiler.vim'
Plug 'rstacruz/sparkup'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-startify'
Plug 'junegunn/fzf.vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'}
call plug#end()
"------------------------------------fzf config---------------------------------
set rtp+=/usr/local/opt/fzf
nnoremap <C-g> :ProjectRootExe Rg<Cr>
nnoremap <C-p> :ProjectRootExe Files<Cr>
nnoremap <leader>r :ProjectRootExe RangerWorkingDirectory<CR>
nnoremap <Leader>w :w<Cr>

"------------------------------------fugitive config----------------------------
" Fugitive Conflict Resolution
nnoremap <leader>gd :Gvdiffsplit!<CR>
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>>
"close all diff windows, leave active open
nnoremap <Leader>gD <c-w>h<c-w>c

"------------------------------------prettier config----------------------------
" run prettier on save
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

"------------------------------------ cocconfig---------------------------------
" GoTo code navigation.
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)
nnoremap <leader>cr :CocRestart
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-prettier',
  \ 'coc-json',
  \ ]
" from readme
" if hidden is not set, TextEdit might fail.
set hidden " Some servers have issues with backup files, see #649 set nobackup set nowritebackup " Better display for messages set cmdheight=2 " You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=450 " milliseconds to wait before triggering plugin after stop typing
set signcolumn=yes " always show signcolumns

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

"-------------------------------ranger-vimsettings------------------------------
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

"-------------------------------vimfiler-settings--------------------------------
nnoremap vf :VimFilerExplorer<Enter>
let g:loaded_netrwPlugin = 0
let g:vimfiler_expand_jump_to_first_child = 1
let g:webdevicons_enable_vimfiler = 1
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_tree_leaf_icon = " "
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_file_icon = '-'
let g:vimfiler_marked_file_icon = '✓'
let g:vimfiler_readonly_file_icon = '✗'
let g:vimfiler_time_format = '%m-%d-%y %H:%M:%S'
let g:vimfiler_expand_jump_to_first_child = 0
let g:vimfiler_ignore_pattern = '\.git\|\.DS_Store\|\.pyc'
