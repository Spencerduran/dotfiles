syntax on
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
highlight ColorColumn ctermbg=0 guibg=lightgrey
"---------------------------------VimPlug--------------------------------------
call plug#begin('~/.vim/plugged')
" neovim lsp plugins
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'tjdevries/nlua.nvim'
Plug 'tjdevries/lsp_extensions.nvim'
"Plug 'prabirshrestha/async.vim'
"Plug 'prabirshrestha/asyncomplete-lsp.vim'
"Plug 'prabirshrestha/asyncomplete.vim'
"Plug 'prabirshrestha/vim-lsp'

" telescope requirements
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/telescope.nvim'

Plug 'Konfekt/FastFold'
Plug 'tpope/vim-vinegar'
Plug 'airblade/vim-gitgutter'
Plug 'chrisbra/csv.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'dbakker/vim-projectroot'
Plug 'edkolev/tmuxline.vim'
Plug 'gruvbox-community/gruvbox'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-dirvish'
Plug 'mbbill/undotree'
Plug 'mhinz/vim-startify'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rbgrouleff/bclose.vim'
Plug 'rstacruz/sparkup'
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'
Plug 'stsewd/fzf-checkout.vim'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vuciv/vim-bujo'

"colorschemes
Plug 'colepeters/spacemacs-theme.vim'
Plug 'sainnhe/gruvbox-material'
Plug 'phanviet/vim-monokai-pro'
Plug 'flazz/vim-colorschemes'
Plug 'chriskempson/base16-vim'
Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end()
"---------------------------------Vim things-----------------------------------
colorscheme gruvbox
set background=dark
let mapleader=" "
let g:gruvbox_contrast_dark = 'hard'
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'

" telescope
let g:telescope_cache_results = 1
let g:telescope_prime_fuzzy_find  = 1

" netrw
"let g:netrw_browse_split = 1 "open files in the previous window
let g:netrw_banner = 0 "disable usesless netrw banner
let g:netrw_winsize = 15 "netrw window size
let g:netrw_localrmdir='rm -r' "allow netrw to remove non-empty directories
"
"
"let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

" airline
let g:airline_section_z = airline#section#create(["\uE0A1" . '%{line(".")}' . "\uE0A3" . '%{col(".")}'])
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_left_sep = "\ue0c6"
let g:airline_right_sep = "\ue0c7"
let g:webdevicons_enable = 1
let g:webdevicons_enable_airline_statusline = 1
let airline#extensions#coc#error_symbol = 'Error:'
let airline#extensions#coc#warning_symbol = 'Warning:'
let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'
" fzf
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
let $FZF_DEFAULT_OPS='--reverse'

inoremap jk <Esc>
nnoremap <C-p> :Files ~<Cr>
nnoremap <C-g> :ProjectRootExe Rg<Cr>
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <leader>b :Buffers<Cr>
nnoremap <Leader>c :TelescopeColorscheme<Cr>
nnoremap <Leader>f :Ex<Cr>
nnoremap <Leader>s :Startify<Cr>
nnoremap <Leader>t :TelescopeBuffers<Cr>
nnoremap <Leader>w :w<Cr>
nnoremap <leader>p :ProjectRootExe :Files<Cr>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <leader>pw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
" lsp
nnoremap <leader>vca :lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>vd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>vh :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>vi :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>vrn :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>vrr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>vsh :lua vim.lsp.buf.signature_help()<CR>
" whitespace chars toggle
nnoremap <F1> :set list! list?<CR>
" pane nagivation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <leader>u :UndotreeShow<CR>
" buffer Switching
nnoremap <Leader>bd :bd<CR>
nnoremap <Leader>bn :bn<CR>
nnoremap <Leader>bn :bn<CR>
nnoremap <Leader>bp :bp<CR>
nnoremap <Leader>ls :ls<CR>
nnoremap <PageUp>   :bprevious<CR>
nnoremap <PageDown> :bnext<CR>
" tab switching
map <C-t><up> :tabr<cr>
map <C-t><down> :tabl<cr>
map <C-t><left> :tabp<cr>
map <C-t><right> :tabn<cr>

" COC SEARCH
nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>
let g:coc_disable_startup_warning = 1

" vim TODO
nmap <Leader>tu <Plug>BujoChecknormal
nmap <Leader>th <Plug>BujoAddnormal
let g:bujo#todo_file_path = $HOME . "/.cache/bujo"

" fugitive
nnoremap <Leader>gc :GBranches<CR>
nnoremap <Leader>gp :GPush<CR>
nnoremap <leader>g :G<CR>
nnoremap gf :diffget //2<CR>
nnoremap gj :diffget //3<CR>>
"close all diff windows, leave active open
nnoremap <Leader>gq <c-w><c-O>

" nvim lsp reqs
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
lua require'nvim_lsp'.tsserver.setup{ on_attach=require'completion'.on_attach }
lua require'nvim_lsp'.clangd.setup{ on_attach=require'completion'.on_attach }
"lua require'nvim_lsp'.pyls.setup{ on_attach=require'completion'.on_attach }


"-------------------------------autoload---------------------------------------
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END
au BufNewFile,BufRead *.json,*.txt setlocal colorcolumn=

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

" returns all modified files of the current git repo
" `2>/dev/null` makes the command fail quietly, so that when we are not
" in a git repo, the list will be empty
function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

"-------------------------------startify---------------------------------------

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
        \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
        \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]
let g:startify_bookmarks = [
        \ { 'c': '~/repos/spencerduran/dotfiles/vim/nvim/init.vim' },
        \ '~/.alacritty.yml',
        \ ]
