"---------------------------------VimPlug--------------------------------------
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
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
  \ 'for': ['javascript', 'typescript', 'json', 'css', 'less', 'scss',
  \'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'airblade/vim-gitgutter'
Plug 'ryanoasis/vim-devicons'
Plug 'shougo/unite.vim'
Plug 'shougo/vimshell.vim'
Plug 'shougo/vimfiler.vim'
Plug 'rstacruz/sparkup'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-startify'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'kevinhwang91/rnvimr'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'neovim/nvim-lsp'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'TaDaa/vimade'
call plug#end()
"---------------------------------Vim things-----------------------------------
set nocompatible " Don't try to be vi compatible
"set shell=bash
let mapleader=" "
:imap jk <Esc>
colorscheme gruvbox
set background=dark
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'
set colorcolumn=80
au BufNewFile,BufRead *.json,*.txt setlocal colorcolumn=
"au BufRead,BufNewFile *.py,*.ts,*.js setlocal textwidth=79
highlight ColorColumn ctermbg=0 guibg=lightgrey
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_invert_selection='0'
" Vim with me
nnoremap <leader>vwm :colorscheme gruvbox<bar>:set background=dark<CR>
nmap <leader>vtm :highlight Pmenu ctermbg=gray guibg=gray
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
"
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
"----------------------------------Airline-------------------------------------
set laststatus=2 " Status bar
let g:airline_section_z = airline#section#create(["\uE0A1" . '%{line(".")}' . "\uE0A3" . '%{col(".")}'])
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_left_sep = "\ue0c6"
let g:airline_right_sep = "\ue0c7"
let g:webdevicons_enable = 1
let g:webdevicons_enable_airline_statusline = 1

"------------------------------------Search------------------------------------


"------------------------------------fzf config--------------------------------
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

" Border color
"let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Todo' } }
" Border style (rounded / sharp / horizontal)
"let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Todo', 'border': 'rounded' } }
"set rtp+=/usr/local/opt/fzf
"
"------------------------------------fugitive config---------------------------
" Fugitive Conflict Resolution
nnoremap <leader>Gd :Gvdiffsplit!<CR>
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>>
"close all diff windows, leave active open
nnoremap <Leader>gD <c-w>h<c-w>c
"
"-------------------------------nvmim-lsp settings-----------------------------
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
lua require'nvim_lsp'.tsserver.setup{ on_attach=require'completion'.on_attach }
"lua require'nvim_lsp'.pyls.setup{ on_attach=require'completion'.on_attach }
"lua require'nvim_lsp'.clangd.setup{ on_attach=require'completion'.on_attach }
"lua require'nvim_lsp'.gopls.setup{ on_attach=require'completion'.on_attach }
"

"lua << EOF
"local configs = require 'nvim_lsp/configs'
"
"configs.pyls = {
"  default_config = {
"    cmd = {"pyls"};
"    filetypes = {"python"};
"    root_dir = function(fname)
"      return vim.fn.getcwd()
"    end;
"  };
"    description = [[
"https://github.com/palantir/python-language-server
"`python-language-server`, a language server for Python.
"    ]];
"    default_config = {
"    };
"  };
"};
"
"EOF

nnoremap <leader>vd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>vi :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>vsh :lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>vrr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>vrn :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>vh :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>vca :lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> <leader>ld    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <leader>lh    <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <leader>ld    <cmd>lua vim.lsp.util.show_line_diagnostics()<CR>
nnoremap <silent> <leader>lk    <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <leader>lr    <cmd>lua vim.lsp.buf.references()<CR>
"
"-------------------------------ranger-vimsettings-----------------------------
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

"-------------------------------vimfiler-settings------------------------------
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


"----------------------------------Whitespace ---------------------------------
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
"set smartindent

set listchars=tab:..,trail:_,extends:>,precedes:<,nbsp:~,eol:$,space:_

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

"let g:LanguageClient_serverCommands = {
"    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
"    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
"    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
"    \ 'python': ['/usr/local/bin/pyls'],
"    \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
"    \ }
"
" note that if you are using Plug mapping you should not use `noremap` mappings.
nmap <F5> <Plug>(lcn-menu)
" Or map each action separately
nmap <silent>K <Plug>(lcn-hover)
nmap <silent> gd <Plug>(lcn-definition)
nmap <silent> <F2> <Plug>(lcn-rename)
