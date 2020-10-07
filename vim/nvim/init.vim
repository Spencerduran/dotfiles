"---------------------------------VimPlug---------------------------------------
call plug#begin('~/.vim/plugged')
Plug 'wincent/command-t'
Plug 'edkolev/tmuxline.vim'
Plug 'chrisbra/csv.vim'
Plug 'mbbill/undotree'
Plug 'dbakker/vim-projectroot'
Plug 'christoomey/vim-tmux-navigator'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'tpope/vim-fugitive'
Plug 'rbgrouleff/bclose.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'json', 'css', 'less', 'scss', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'airblade/vim-gitgutter'
Plug 'ryanoasis/vim-devicons'
Plug 'shougo/unite.vim'
Plug 'shougo/vimshell.vim'
Plug 'shougo/vimfiler.vim'
Plug 'rstacruz/sparkup'
Plug 'mhinz/vim-startify'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'sheerun/vim-polyglot'
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
call plug#end()
"---------------------------------Vim things------------------------------------
set nocompatible " Don't try to be vi compatible
"set shell=bash
let mapleader=" "
:imap jk <Esc>
colorscheme dracula
set cmdheight=1
set encoding=UTF-8
set noerrorbells
set belloff=all
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set title " Show filename in titlebar of window
set noswapfile " Disable .swp files
set nobackup " disable backups before writing file
set nowritebackup " disable backup before writing file
set undofile "store undo history to a file
set undodir=~/.vim/undodir "set vim undo file location
set number " Show current line number
set relativenumber " Show relative line numbers
set clipboard=unnamed,unnamedplus " Use system clipboard.
set shortmess+=c " don't give ins-completion-menu messages.
:set mouse=n "set mouse mode for terminal window resizing
" Normal Mode
set wildmenu " Command-line completion operates in an enhanced mode.
set cmdwinheight=18 " Height of the command window size for commands like `q:` and `q/`.
set hidden " if hidden is not set, TextEdit might fail.
set updatetime=50 " milliseconds to wait before triggering plugin after stop typing
set signcolumn=yes " always show signcolumns
set history=10 " Define maximum command history size.
set noshowmode " Disable native mode indicator.
" Buffers
set splitbelow " Splitting a window will put the new window below of the current one.
set splitright " Splitting a window will put the new window right of the current one.
" Editor
set scrolloff=4 " Minimum number of screen lines to keep above and below the cursor.
set cursorline " Highlight the line background of the cursor.
set fillchars= " Characters to fill the status lines and vertical separators.
set conceallevel=0 " Dont hide symbols in MD and JSON
set showmatch
set ttyfast " Rendering

"------------------------------------Search-------------------------------------
set incsearch
set hlsearch
set ignorecase
set showmatch

"---------------------------------Pane nagivation-------------------------------
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <leader>u :UndotreeShow<CR>
" Buffer Switching
nnoremap <Leader>bn :bn<CR>
nnoremap <Leader>bn :bn<CR>
nnoremap <Leader>bd :bd<CR>
nnoremap <Leader>ls :ls<CR>
nnoremap <Leader>bp :bp<CR>
nnoremap <Leader>g :e#<CR>
nnoremap <PageUp>   :bprevious<CR>
nnoremap <PageDown> :bnext<CR>
" Tab switching
map <C-t><up> :tabr<cr>
map <C-t><down> :tabl<cr>
map <C-t><left> :tabp<cr>
map <C-t><right> :tabn<cr>
" Window resizing
nnoremap <Leader>+ :exe "resize " . (winwidth(0) * 3/2)<CR>
nnoremap <Leader>- :exe "resize " . (winwidth(0) * 2/3)<CR>

"------------------------------------fzf config---------------------------------
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

" Border color
"let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Todo' } }
" Border style (rounded / sharp / horizontal)
"let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Todo', 'border': 'rounded' } }
"set rtp+=/usr/local/opt/fzf
nnoremap <C-g> :ProjectRootExe Rg<Cr>
nnoremap <leader>p :ProjectRootExe Files<Cr>
nnoremap <C-p> :Files ~<Cr>
nnoremap <leader>t :CommandTBuffer<CR>
nnoremap <Leader>w :w<Cr>
"------------------------------------fugitive config----------------------------
" Fugitive Conflict Resolution
nnoremap <leader>Gd :Gvdiffsplit!<CR>
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>>
"close all diff windows, leave active open
nnoremap <Leader>gD <c-w>h<c-w>c

"------------------------------------ cocconfig---------------------------------
autocmd BufNew,BufEnter *.json,*.vim execute "silent! CocDisable"
autocmd BufLeave *.json,*.vim, execute "silent! CocDisable"
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
  \ ]
"
"function! s:check_back_space() abort
"  let col = col('.') - 1
"  return !col || getline('.')[col - 1]  =~# '\s'
"endfunction
"
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

"-------------------------------ranger-vimsettings------------------------------
"open ranger in current directory
nnoremap <leader>r :ProjectRootExe RangerWorkingDirectory<CR>

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

"-------------------------------vimfiler-settings-------------------------------
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

"-------------------------------autoload RCz------------------------------------
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

"----------------------------------Whitespace ----------------------------------
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
"set smartindent

set list listchars=tab:..,trail:_,extends:>,precedes:<,nbsp:~,eol:$,space:_

"toggle display white space characters with F1
nnoremap <F1> :set list! list?<CR>

" no indent on paste
set pastetoggle=<F2>
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

autocmd BufWinEnter <buffer> match Error /\s\+$/
autocmd InsertEnter <buffer> match Error /\s\+\%#\@<!$/
autocmd InsertLeave <buffer> match Error /\s\+$/
autocmd BufWinLeave <buffer> call clearmatches()
