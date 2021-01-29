set nocompatible
set background=dark
set backspace=indent,eol,start "allow backspace over everything in insert mode
set belloff=all
set clipboard=unnamed,unnamedplus " Use system clipboard.
set colorcolumn=80
set completeopt=menuone,noinsert,noselect
set conceallevel=0 " Dont hide symbols in MD and JSON
set cursorline " Highlight the line background of the cursor.
set encoding=UTF-8
set expandtab "set the tabs to display as spaces
set fillchars= " Characters to fill the status lines and vertical separators.
set foldmethod=manual
set guicursor=
set hidden "opening a new file when the current buffer has unsaved changes causes files to be hidden instead of closed
set history=10 " Define maximum command history size.
set hlsearch " highlight search
set ignorecase
set incsearch " incremental search
set laststatus=2 " Status bar
set listchars=tab:..,trail:_,extends:>,precedes:<,nbsp:~,eol:$,space:_
set mouse=n "set mouse mode for terminal window resizing
set nobackup " disable backups before writing file
set noerrorbells
set noshowmode " Disable native mode indicator.
set noswapfile " Disable .swp files
set nowrap
set nowritebackup " disable backup before writing file
set nu "enable line numbers
set relativenumber " Show relative line numbers
set scrolloff=8 " Minimum number of screen lines to keep above and below the cursor.
set shell=bash
set shiftwidth=4
set shortmess+=c " don't give ins-completion-menu messages.
set showcmd " Show commands in statusline
set showmatch
set signcolumn=yes " always show signcolumns
set smartcase
set smartindent
set splitright " Splitting a window will put the new window right of the current one.
set tabstop=4 softtabstop=4
set termguicolors
set title " Show filename in titlebar of window
set ttyfast " Rendering
set undodir=~/.vim/undodir "set vim undo file location
set undofile "store undo history to a file
set updatetime=50 " milliseconds to wait before triggering plugin after stop typing
set wildmenu " Command-line completion operates in an enhanced mode.
syntax on
filetype plugin on
highlight ColorColumn ctermbg=0 guibg=lightgrey
au BufNewFile,BufRead *.json,*.txt setlocal colorcolumn=
"---------------------------------VimPlug--------------------------------------
call plug#begin('~/.vim/plugged')
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'dbakker/vim-projectroot'
Plug 'edkolev/tmuxline.vim'
Plug 'file://'.expand('~/.local/share/nvim/site/plugin/CopyMatches') 
Plug 'file://'.expand('~/.local/share/nvim/site/plugin/Rename') 
Plug 'francoiscabrol/ranger.vim'
Plug 'gruvbox-community/gruvbox'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-dirvish'
Plug 'kristijanhusak/vim-dirvish-git'
Plug 'mbbill/undotree'
Plug 'mhinz/vim-startify'
Plug 'neoclide/vim-easygit'
Plug 'panozzaj/vim-autocorrect'
Plug 'rbgrouleff/bclose.vim'
Plug 'reedes/vim-pencil'
Plug 'rstacruz/sparkup'
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'
Plug 'stsewd/fzf-checkout.vim'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-vinegar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vimwiki/vimwiki'
"colorschemes
Plug 'flazz/vim-colorschemes'
Plug 'chriskempson/base16-vim'
Plug 'dracula/vim'
call plug#end()
"---------------------------------Vim things-----------------------------------
let mapleader=" "
" set python path
let g:python3_host_prog = '/Users/sduran/.pyenv/versions/3.6.8/bin/python'
" arrange csv files left
"let g:csv_arrange_align = 'l*'

inoremap jk <Esc>
" quicksave
nnoremap <Leader>w :w<Cr>
" :H opens help in current window
command! -nargs=1 -complete=help H :enew | :set buftype=help | :h <args>
" default help opens verical split
augroup vimrc_help
  autocmd!
  autocmd BufEnter *.txt if &buftype == 'help' | wincmd L | endif
augroup END
" set current directory to the directory of the file in the current window
autocmd BufEnter * silent! lcd %:p:h
" toggle whitespace characters
nnoremap <F1> :set list! list?<CR>
" copy current buffer file path to clipboard
nnoremap <Leader>cp :let @+=expand('%:p')<CR>
" remove ^M carraige return symbols
nnoremap <Leader>cr :e ++ff=dos<Cr>
" remove all buffers EXCEPT current
command! BufOnly silent! execute "%bd|e#|bd#"
" reload init.vim
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
" close all buffers except current 
nnoremap <Leader>bo :BufOnly<CR>
" delete trailing whitespace 
nnoremap <Leader>dw :%s/\s\+$//e<CR>

"-----------------------------Colorscheme things-------------------------------
" required for tmux colorschemes
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
"colorschemes
"colorscheme base16-darktooth
colorscheme base16-seti
"colorscheme base16-unikitty-dark
set background=dark
"autocmd BufEnter *.txt,*.wiki colorscheme seti
"--------------------------------VimWiki---------------------------------------
let g:vimwiki_conceal_pre =1
let g:vimwiki_autowriteall =1
let g:vimwiki_use_calendar =1
let g:vimwiki_list = [{'path': '~/OneDrive - Knex/Documents/VimWiki/Notes', 'auto_diary_index': 1}]
let g:vimwiki_list = [{'path': '~/OneDrive - Knex/Documents/VimWiki/Notes', 'auto_generate_links': 1}]
let g:vimwiki_list = [{'path': '~/OneDrive - Knex/Documents/VimWiki/Notes', 'auto_tags': 1}]
let g:vimwiki_list = [{'path': '~/OneDrive - Knex/Documents/VimWiki/Notes', 'auto_generate_tags': 1}]
let g:vimwiki_list = [{'path': '~/OneDrive - Knex/Documents/VimWiki/Notes', 'auto_toc': 1}]
" function to enable text editing features
fun! Wp()
  set lbr
  source /Users/sduran/.vim/plugged/vim-autocorrect/plugin/autocorrect.vim
  execute ":SoftPencil"
  nnoremap j gj
  nnoremap k gk
  nnoremap 0 g0
  nnoremap $ g$
  set nonumber
  set spell spelllang=en_us
endfu
autocmd FileType vimwiki map <leader>wp :call Wp()<CR>
"au BufNewFile,BufRead *.wiki,*.txt,*.md :call Wp()

au BufRead,BufNewFile *.wiki set filetype=vimwiki
function! ToggleCalendar()
  execute ":Calendar"
  if exists("g:calendar_open")
    if g:calendar_open == 1
      execute "q"
      unlet g:calendar_open
    else
      g:calendar_open = 1
    end
  else
    let g:calendar_open = 1
  end
endfunction
autocmd FileType vimwiki map <leader>c :call ToggleCalendar()<CR>

" automatically update links on read diary
augroup vimwikigroup
    autocmd!
    autocmd BufRead,BufNewFile diary.wiki VimwikiDiaryGenerateLinks
augroup end

function! VimwikiLinkHandler(link)
  " Use Vim to open external files with the 'vfile:' scheme.  E.g.:
  "   1) [[vfile:~/Code/PythonProject/abc123.py]]
  "   2) [[vfile:./|Wiki Home]]
  let link = a:link
  if link =~# '^vfile:'
    let link = link[1:]
  else
    return 0
  endif
  let link_infos = vimwiki#base#resolve_link(link)
  if link_infos.filename == ''
    echomsg 'Vimwiki Error: Unable to resolve link!'
    return 0
  else
    exe 'e ' . fnameescape(link_infos.filename)
    return 1
  endif
endfunction
"--------------------------------Netrw-----------------------------------------
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
let g:netrw_banner = 0 "disable usesless netrw banner
let g:netrw_winsize = 15 "netrw window size
let g:netrw_localrmdir='rm -r' "allow netrw to remove non-empty directories
"let g:netrw_browse_split = 1 "open files in the previous window

"--------------------------------FZF-------------------------------------------
nnoremap <C-p> :Files ~<Cr>
nnoremap <leader>b :Buffers<Cr>
nnoremap <leader>p :ProjectRootExe :Files<Cr>
nnoremap <C-g> :ProjectRootExe Rg<Cr>
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }
let $FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --margin=1,4 --preview 'bat --color=always --style=header,grid --line-range :300 {}'"
let $FZF_DEFAULT_COMMAND = 'rg --files --ignore-case --hidden -g "!{.git,node_modules,vendor}/*"'
command! -bang -nargs=? -complete=dir Files
     \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

"-------------------------tabs/buffers/panes-----------------------------------
map <C-t><up>       :tabr<cr>
map <C-t><down>     :tabl<cr>
map <C-t><left>     :tabp<cr>
map <C-t><right>    :tabn<cr>
nnoremap <PageUp>   :bprevious<CR>
nnoremap <PageDown> :bnext<CR>
nnoremap <Leader>bd :bd<CR>
nnoremap <Leader>bn :bn<CR>
nnoremap <Leader>bn :bn<CR>
nnoremap <Leader>bp :bp<CR>
nnoremap <Leader>ls :ls<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"--------------------------------airline---------------------------------------
let g:webdevicons_enable = 1
let g:airline_powerline_fonts = 1
let g:webdevicons_enable_airline_statusline = 1
let g:airline_left_sep = "\ue0c6"
let g:airline_right_sep = "\ue0c7"
let g:airline_section_z = airline#section#create(["\uE0A1" . '%{line(".")}' . "\uE0A3" . '%{col(".")}'])
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#coc#error_symbol = 'Error:'
let g:airline#extensions#coc#warning_symbol = 'Warning:'
let g:airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
let g:airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'

"-------------------------------dirvish----------------------------------------
nnoremap <leader>f :Dirvish<CR>
"-------------------------------ranger-----------------------------------------
let g:ranger_map_keys = 0
nnoremap <leader>r :Ranger<CR>

"-------------------------------startify---------------------------------------
nnoremap <Leader>s :Startify<Cr>
let g:startify_change_to_dir = 1 "When opening a file or bookmark, change to its directory

" same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_lists = [
        \ { 'type': 'files',     'header': ['   MRU']            },
        \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]

let g:startify_bookmarks = [
        \ { 'i': '~/repos/spence/dotfiles/vim/nvim/init.vim' },
        \ { 'c': '~/repos/spence/dotfiles/vim/nvim/coc-settings.json' },
        \ { 'a': '~/.alacritty.yml' },
        \ { 'h': '~/.hammerspoon/init.lua' },
        \ ]

"-------------------------------autoload---------------------------------------
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END
"
