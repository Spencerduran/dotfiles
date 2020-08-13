"---------------------------------VimPlug--------------------------------
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
"-----------------------------------Vim settings--------------------------------------
let mapleader=" "
colorscheme dracula
"set nofixendofline "disable newline at end of last line
"set noendofline
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
set conceallevel=0 " Dont hide symbols in MD and JSON
set showmatch
set foldmethod=syntax
set foldlevel=2
: filetype plugin on
"fonts
let g:airline_section_z = airline#section#create(["\uE0A1" . '%{line(".")}' . "\uE0A3" . '%{col(".")}'])
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_left_sep = "\ue0c6"
let g:airline_right_sep = "\ue0c7"
let g:webdevicons_enable = 1
let g:webdevicons_enable_airline_statusline = 1
" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>
" Last line
"set showmode
"set showcmd
:imap jk <Esc>
"autoread and auto save on focus change
"let autoreadargs={'autoread':1}
"execute WatchForChanges("*",autoreadargs)
"au FocusGained,BufEnter * :checktime
"au FocusGained,BufEnter * :silent! !
"au FocusLost,WinLeave * :silent! noautocmd w
" Turn on syntax highlighting
set filetype=json
syntax on
set encoding=UTF-8
" Rendering
set ttyfast
" Status bar
set laststatus=2
autocmd BufWritePre * :%s/\s\+$//e " Remove whitespace on save
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

"------------------------------------fzf config---------------------------------
set rtp+=/usr/local/opt/fzf
nnoremap <C-g> :ProjectRootExe Rg<Cr>
nnoremap <leader>p :ProjectRootExe Files<Cr>
nnoremap <C-p> :Files ~<Cr>
nnoremap <leader>t :CommandTBuffer<CR>
nnoremap <leader>r :ProjectRootExe RangerWorkingDirectory<CR>
nnoremap <Leader>w :w<Cr>
"nnoremap <Leader>w :set binary<Cr> \| :set noeol<Cr> \| :w<Cr>

"------------------------------------fugitive config----------------------------
" Fugitive Conflict Resolution
nnoremap <leader>gd :Gvdiffsplit!<CR>
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>>
"close all diff windows, leave active open
nnoremap <Leader>gD <c-w>h<c-w>c

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

"--------------------------------fzf/rg popup window--------------------------------
fu s:snr() abort
    return matchstr(expand('<sfile>'), '.*\zs<SNR>\d\+_')
endfu
let s:snr = get(s:, 'snr', s:snr())
let g:fzf_layout = {'window': 'call '..s:snr..'fzf_window(0.9, 0.6, "Comment")'}

fu s:fzf_window(width, height, border_highlight) abort
    let width = float2nr(&columns * a:width)
    let height = float2nr(&lines * a:height)
    let row = float2nr((&lines - height) / 2)
    let col = float2nr((&columns - width) / 2)
    let top = '┌' . repeat('─', width - 2) . '┐'
    let mid = '│' . repeat(' ', width - 2) . '│'
    let bot = '└' . repeat('─', width - 2) . '┘'
    let border = [top] + repeat([mid], height - 2) + [bot]
    if has('nvim')
        let frame = s:create_float(a:border_highlight, {
            \ 'row': row,
            \ 'col': col,
            \ 'width': width,
            \ 'height': height,
            \ })
        call nvim_buf_set_lines(frame, 0, -1, v:true, border)
        call s:create_float('Normal', {
            \ 'row': row + 1,
            \ 'col': col + 2,
            \ 'width': width - 4,
            \ 'height': height - 2,
            \ })
        exe 'au BufWipeout <buffer> bw '..frame
    else
        let frame = s:create_popup_window(a:border_highlight, {
            \ 'line': row,
            \ 'col': col,
            \ 'width': width,
            \ 'height': height,
            \ 'is_frame': 1,
            \ })
        call setbufline(frame, 1, border)
        call s:create_popup_window('Normal', {
            \ 'line': row + 1,
            \ 'col': col + 2,
            \ 'width': width - 4,
            \ 'height': height - 2,
            \ })
    endif
endfu

fu s:create_float(hl, opts) abort
    let buf = nvim_create_buf(v:false, v:true)
    let opts = extend({'relative': 'editor', 'style': 'minimal'}, a:opts)
    let win = nvim_open_win(buf, v:true, opts)
    call setwinvar(win, '&winhighlight', 'NormalFloat:'..a:hl)
    return buf
endfu

fu s:create_popup_window(hl, opts) abort
    if has_key(a:opts, 'is_frame')
        let id = popup_create('', #{
            \ line: a:opts.line,
            \ col: a:opts.col,
            \ minwidth: a:opts.width,
            \ minheight: a:opts.height,
            \ zindex: 50,
            \ })
        call setwinvar(id, '&wincolor', a:hl)
        exe 'au BufWipeout * ++once call popup_close('..id..')'
        return winbufnr(id)
    else
        let buf = term_start(&shell, #{hidden: 1})
        call popup_create(buf, #{
            \ line: a:opts.line,
            \ col: a:opts.col,
            \ minwidth: a:opts.width,
            \ minheight: a:opts.height,
            \ zindex: 51,
            \ })
        exe 'au BufWipeout * ++once bw! '..buf
    endif
endfu
"-------------------------------run macro on multiple visual lines---------------
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction
