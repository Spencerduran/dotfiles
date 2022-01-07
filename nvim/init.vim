set nocompatible
set background=dark
set backspace=indent,eol,start "allow backspace over everything in insert mode
set belloff=all
set clipboard=unnamed,unnamedplus " Use system clipboard.
set colorcolumn=80
set conceallevel=0 " Dont hide symbols in MD and JSON
set cursorline " Highlight the line background of the cursor.
set encoding=UTF-8
"set expandtab "set the tabs to display as spaces
set fillchars= " Characters to fill the status lines and vertical separators.
set foldmethod=manual
set guicursor=
set hidden "opening a new file when the current buffer has unsaved changes causes files to be hidden instead of closed
set history=10 " Define maximum command history size.
set hlsearch " highlight search
set ignorecase
set incsearch " incremental search
set laststatus=2 " Status bar
set listchars=tab:..,trail:_,nbsp:~,eol:$,space:_
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
"Plug 'neoclide/coc.nvim'
Plug 'yegappan/greplace'
Plug 'aadhav-n1/punchy.vim'
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'airblade/vim-gitgutter'
Plug 'kosayoda/nvim-lightbulb'
"Plug 'beeender/Comrade'
Plug 'christoomey/vim-tmux-navigator'
Plug 'dbakker/vim-projectroot'
Plug 'edkolev/tmuxline.vim'
Plug 'file://'.expand('~/.local/share/nvim/site/plugin/CopyMatches') 
Plug 'file://'.expand('~/.local/share/nvim/site/plugin/Rename') 
Plug 'francoiscabrol/ranger.vim'
"Plug 'gruvbox-community/gruvbox'
Plug 'morhetz/gruvbox'
"Plug 'hrsh7th/vim-vsnip'
"Plug 'hrsh7th/vim-vsnip-integ'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'kristijanhusak/defx-git'
Plug 'kristijanhusak/defx-icons'
Plug 'mbbill/undotree'
Plug 'mhinz/vim-startify'
Plug 'neoclide/vim-easygit'
Plug 'panozzaj/vim-autocorrect'
Plug 'rbgrouleff/bclose.vim'
Plug 'reedes/vim-pencil'
Plug 'rstacruz/sparkup'
Plug 'ryanoasis/vim-devicons'
Plug 'sbdchd/neoformat'
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-syntastic/syntastic'
Plug 'vimwiki/vimwiki'
Plug 'nvim-lua/completion-nvim'
Plug 'steelsojka/completion-buffers'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'nvim-treesitter/completion-treesitter'
"Plug 'nvim-treesitter/nvim-treesitter-refactor'
Plug 'nvim-treesitter/playground'
Plug 'romgrk/nvim-treesitter-context'
Plug 'editorconfig/editorconfig-vim'
Plug 'hrsh7th/nvim-compe'
"colorschemes
Plug 'kyoz/purify', { 'rtp': 'vim' }
Plug 'relastle/bluewery.vim'
Plug 'flazz/vim-colorschemes'
Plug 'chriskempson/base16-vim'
Plug 'dracula/vim'
Plug 'neovim/nvim-lspconfig'
call plug#end()
"---------------------------------Vim things-----------------------------------
let mapleader=" "
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
" fold za using space
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
"----------------------windows/buffers/panes-----------------------------------
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
"-----------------------------vsnip--------------------------------------------
" You can use other key to expand snippet.
"imap <expr> <C-j>   vsnip#available(1)  ? '<Plug>(vsnip-expand)'         : '<C-j>'
"imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
"smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
"imap <expr> <C-j>   vsnip#available(1)  ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
"smap <expr> <C-j>   vsnip#available(1)  ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
"imap <expr> <C-k> vsnip#available(-1) ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
"smap <expr> <C-k> vsnip#available(-1) ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
"let g:vsnip_snippet_dir = expand('~/.config/nvim/snippet')
"-----------------------------nvim lsp-----------------------------------------
lua require'lspconfig'.jedi_language_server.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.pyls.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.pyright.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.yamlls.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.jsonls.setup{ on_attach=require'completion'.on_attach }
nnoremap <leader>vca :lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>vd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>vi :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>vrn :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>vrr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>vsd :lua vim.lsp.util.show_line_diagnostics(); vim.lsp.util.show_line_diagnostics()<CR>
nnoremap <leader>vsh :lua vim.lsp.buf.signature_help()<CR>
nnoremap gn :lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap gp :lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent>K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent>g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent>gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent>gd    <cmd>lua vim.lsp.buf.declaration()<CR>
"nnoremap <silent>ff    <cmd>lua vim.lsp.buf.formatting()<CR>
autocmd BufEnter * lua require'completion'.on_attach()
set omnifunc=v:lua.vim.lsp.omnifunc
"-----------------------------Completion---------------------------------------
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Avoid showing message extra message when using completion
set shortmess+=c

let g:completion_enable_snippet = 'UltiSnips'
let g:UltiSnipsSnippetDirectories=["UltiSnips", "snips"]
"let g:UltiSnipsSnippetDirectories=["UltiSnips", "/Users/sduran/.config/nvim/snippet"]
let g:completion_chain_complete_list = [
    \{'complete_items': ['lsp', 'snippet', 'buffers', 'path']},
    \{'mode': '<c-p>'},
    \{'mode': '<c-n>'}
\]
set completeopt=longest,menuone,noinsert,noselect
let g:completion_enable_auto_hover = 1
"Defaults
"g:UltiSnipsExpandTrigger               <tab>
"g:UltiSnipsListSnippets                <c-tab>
"g:UltiSnipsJumpForwardTrigger          <c-j>
"g:UltiSnipsJumpBackwardTrigger         <c-k>
let g:UltiSnipsExpandTrigger = '<f5>'

"-----------------------------Neoformat----------------------------------------
"
nnoremap <Leader>ff :Neoformat<CR>
let g:neoformat_enabled_json = ['prettier']
"
"-----------------------------Syntastic----------------------------------------
set statusline+=%#warningmsg#
set statusline+=%*
set statusline+=%{SyntasticStatuslineFlag()}
let g:syntastic_aggregate_errors = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_enable_balloons = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = {"mode": "passive", "passive_filetypes": []}
let g:syntastic_quiet_messages = {"regex": ['E501', 'module docstring']}
let g:syntastic_shell = "/bin/sh"
"let g:syntastic_python_checkers = ["mypy"]
let g:syntastic_python_checkers = ["flake8", "pep8", "pycodestyle", "pyflakes", "pylint", "python"]
let g:syntastic_error_symbol = '✗✗'
let g:syntastic_style_error_symbol = '✠✠'
let g:syntastic_warning_symbol = '∆∆'
let g:syntastic_style_warning_symbol = '≈≈'
"-----------------------------Easygit things-----------------------------------
let easygit_enable_command = 1
nnoremap <Leader>gd :GdiffThis<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>ga :Gadd<CR>
nnoremap <Leader>gc :Gcommit

"-----------------------------Colorscheme things-------------------------------
" required for tmux colorschemes
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
"colorscheme base16-darktooth
"colorscheme gruvbox
"colorscheme base16-seti
"colorscheme turtles
"colorscheme base16-unikitty-light
"colorscheme base16-dracula
colorscheme Purify
"

"--------------------------------VimWiki---------------------------------------
let g:vimwiki_table_mappings = 0 "avoid conflict with auto complete
let g:vimwiki_conceal_pre =1
let g:vimwiki_autowriteall =1
let g:vimwiki_use_calendar =1
let g:vimwiki_list = [
    \{'path': '~/Documents/vimwiki', 
    \ 'auto_diary_index': 1,
    \ 'auto_generate_links': 1,
    \ 'auto_tags': 1,
    \ 'auto_generate_tags': 1,
    \ 'auto_toc': 1}]
"let g:vimwiki_list = [{'path': '~/OneDrive - Knex/Documents/VimWiki/Notes', 'auto_generate_links': 1}]
"let g:vimwiki_list = [{'path': '~/OneDrive - Knex/Documents/VimWiki/Notes', 'auto_tags': 1}]
"let g:vimwiki_list = [{'path': '~/OneDrive - Knex/Documents/VimWiki/Notes', 'auto_generate_tags': 1}]
"let g:vimwiki_list = [{'path': '~/OneDrive - Knex/Documents/VimWiki/Notes', 'auto_toc': 1}]
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
endfu


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
autocmd FileType vimwiki map <leader>wp :call Wp()<CR>
"au BufNewFile,BufRead *.wiki,*.txt,*.md :call Wp()

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
"--------------------------------FZF-------------------------------------------
nnoremap <C-p> :Files ~<Cr>
nnoremap <leader>b :Buffers<Cr>
nnoremap <leader>p :ProjectRootExe :Files<Cr>
nnoremap <C-g> :ProjectRootExe Rg<Cr>
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }
"let $FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --margin=1,4 --preview 'bat --color=always --style=header,grid --line-range :300 {} --hidden -g '!{~/Library,.git,node_modules,vendor,.vim}/*'"
let $FZF_DEFAULT_COMMAND = 'rg --files --ignore-case --hidden -g "!{.pyenv,.local,.idea,.vscode,tmp,Library,.vim,.git,node_modules,vendor,OneDrive\ -\ Knex}/*"'
command! -bang -nargs=? -complete=dir Files
     \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

"-------------------------------ranger-----------------------------------------
let g:ranger_map_keys = 0
nnoremap <leader>- :Ranger<CR>


"--------------------------------airline---------------------------------------
let g:webdevicons_enable = 1
let g:airline_powerline_fonts = 1
let g:webdevicons_enable_airline_statusline = 1
let g:airline_left_sep = "\ue0c6"
let g:airline_right_sep = "\ue0c7"
let g:airline_section_z = airline#section#create([ "\uE0A1" . '%{line(".")}' . "\uE0A3" . '%{col(".")}'])
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#formatter = 'default'
"let g:airline_theme='biogoo'

"-------------------------------defx-------------------------------------------
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

" let g:vimfiler_as_default_explorer = 1

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
  " double click/Enter/l to open file
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
" disable netrw.
augroup FileExplorer
  autocmd!
augroup END
augroup defx_group
  autocmd!
  " Move focus to the next window if current buffer is defx
  autocmd TabLeave * if &ft ==# 'defx' | wincmd w | endif
  " keymap
  autocmd FileType defx do WinEnter | call s:defx_keymaps()
  " replace netrw to defx
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
        \ { 'i': '~/repos/spence/dotfiles/nvim/init.vim' },
        \ { 'a': '~/.alacritty.yml' },
        \ { 'h': '~/.hammerspoon/init.lua' },
        \ ]

"-------------------------------autoload---------------------------------------
autocmd BufEnter * silent! lcd %:p:h
