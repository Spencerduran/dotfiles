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
"---------------------------------VimPlug--------------------------------------
call plug#begin('~/.vim/plugged')
" neovim lsp plugins
"Plug 'neovim/nvim-lspconfig'
"Plug 'nvim-lua/completion-nvim'
"Plug 'tjdevries/nlua.nvim'
"Plug 'tjdevries/lsp_extensions.nvim'
"Plug 'prabirshrestha/async.vim'
"Plug 'prabirshrestha/asyncomplete-lsp.vim'
"Plug 'prabirshrestha/asyncomplete.vim'
"Plug 'prabirshrestha/vim-lsp'
Plug 'airblade/vim-gitgutter'
Plug 'chrisbra/csv.vim'
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
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'neoclide/vim-easygit'
Plug 'panozzaj/vim-autocorrect'
Plug 'rbgrouleff/bclose.vim'
Plug 'reedes/vim-pencil'
Plug 'rstacruz/sparkup'
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'
Plug 'stsewd/fzf-checkout.vim'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vimwiki/vimwiki'
"Plug 'vuciv/vim-bujo'

"colorschemes
Plug 'colepeters/spacemacs-theme.vim'
"Plug 'sainnhe/gruvbox-material'
Plug 'phanviet/vim-monokai-pro'
Plug 'flazz/vim-colorschemes'
Plug 'chriskempson/base16-vim'
Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end()
"---------------------------------Vim things-----------------------------------
let mapleader=" "
colorscheme dracula
"let g:gruvbox_contrast_dark = 'hard'
"let g:gruvbox_invert_selection='0'
set background=dark

if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'
inoremap jk <Esc>
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <Leader>w :w<Cr>
"open :h windows in current window
command! -nargs=1 -complete=help H :enew | :set buftype=help | :h <args>
" whitespace chars toggle
"nnoremap <F1> :set list! list?<CR>
let vim_markdown_preview_github=1
let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_browser='Google Chrome'
let g:python3_host_prog = '/Users/sduran/.pyenv/versions/3.6.8/bin/python'
let b:csv_arrange_align = 'l*'
let g:calendar_options = 'nornu'
" remove ^M carraige return symbols
nnoremap <Leader>cr :e ++ff=dos<Cr>
" remove all buffers EXCEPT current
command BufOnly silent! execute "%bd|e#|bd#"
"--------------------------------VimWiki---------------------------------------
cabbr wp call Wp()
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
"au BufNewFile,BufRead *.wiki,*.txt,*.md :call Wp()
autocmd FileType vimwiki map <leader>wp :call Wp()<CR>

let g:vimwiki_list = [
                        \{'path': '~/OneDrive - Knex/Documents/VimWiki/Notes'},
                        \{'path': '~/OneDrive - Knex/Documents/VimWiki/Wiki2'}
                \]
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
command! Diary VimwikiDiaryIndex
augroup vimwikigroup
    autocmd!
    " automatically update links on read diary
    autocmd BufRead,BufNewFile diary.wiki VimwikiDiaryGenerateLinks
augroup end
let g:vimwiki_list = [{'path': '~/OneDrive - Knex/Documents/VimWiki/Notes', 'auto_diary_index': 1}]
let g:vimwiki_list = [{'path': '~/OneDrive - Knex/Documents/VimWiki/Notes', 'auto_generate_links': 1}]
let g:vimwiki_list = [{'path': '~/OneDrive - Knex/Documents/VimWiki/Notes', 'auto_tags': 1}]
let g:vimwiki_list = [{'path': '~/OneDrive - Knex/Documents/VimWiki/Notes', 'auto_generate_tags': 1}]
let g:vimwiki_list = [{'path': '~/OneDrive - Knex/Documents/VimWiki/Notes', 'auto_toc': 1}]

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

"----------------------------nvim lsp------------------------------------------
"let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
"lua require'nvim_lsp'.tsserver.setup{ on_attach=require'completion'.on_attach }
"lua require'nvim_lsp'.clangd.setup{ on_attach=require'completion'.on_attach }
"lua require'nvim_lsp'.pyls.setup{ on_attach=require'completion'.on_attach }
"nnoremap <leader>vca :lua vim.lsp.buf.code_action()<CR>
"nnoremap <leader>vd  :lua vim.lsp.buf.definition()<CR>
"nnoremap <leader>vh  :lua vim.lsp.buf.hover()<CR>
"nnoremap <leader>vi  :lua vim.lsp.buf.implementation()<CR>
"nnoremap <leader>vrn :lua vim.lsp.buf.rename()<CR>
"nnoremap <leader>vrr :lua vim.lsp.buf.references()<CR>
"nnoremap <leader>vsh :lua vim.lsp.buf.signature_help()<CR>

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

"--------------------------------COC-------------------------------------------
let g:coc_disable_startup_warning = 1
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gp <Plug>(coc-diagnostic-prev)
nmap <silent> gn <Plug>(coc-diagnostic-next)
inoremap <silent><expr> <c-space> coc#refresh()
nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <silent> gh :call <SID>show_documentation()<CR>
nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>

"set tab for completion
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.


" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')
" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" Formatting selected code.
xmap <leader>F  <Plug>(coc-format-selected)
nmap <leader>F  <Plug>(coc-format-selected)
" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
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

"-------------------------------ToDo-------------------------------------------
nmap <Leader>tu <Plug>BujoChecknormal
nmap <Leader>th <Plug>BujoAddnormal
let g:bujo#todo_file_path = $HOME . "/.cache/bujo"

"----------------------------Fugitive------------------------------------------
nnoremap <Leader>gc :GBranches<CR>
nnoremap <leader>g :G<CR>
nnoremap gf :diffget //2<CR>
nnoremap gj :diffget //3<CR>>

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

au BufNewFile,BufRead *.json,*.txt setlocal colorcolumn=

" returns all modified files of the current git repo
" `2>/dev/null` makes the command fail quietly, so that when we are not
" in a git repo, the list will be empty
function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

augroup vimrc_help
  autocmd!
  autocmd BufEnter *.txt if &buftype == 'help' | wincmd L | endif
augroup END
