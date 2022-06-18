
--Remap space as leader key
map({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "
let mapleader=" "
--Remap Escape key to "jk"
inoremap jk <Esc>
-- quicksave
nnoremap <Leader>w :w<Cr>
-- :H opens help in current window
command! -nargs=1 -complete=help H :enew | :set buftype=help | :h <args>
-- default help opens verical split
augroup vimrc_help
  autocmd!
  autocmd BufEnter *.txt if &buftype == 'help' | wincmd L | endif
augroup END
-- toggle whitespace characters
nnoremap <F1> :set list! list?<CR>
-- copy current buffer file path to clipboard
nnoremap <Leader>cp :let @+=expand('%:p')<CR>
-- remove ^M carraige return symbols
nnoremap <Leader>cr :e ++ff=dos<Cr>
-- remove all buffers EXCEPT current
command! BufOnly silent! execute "%bd|e#|bd#"
-- reload init.vim
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
-- close all buffers except current 
nnoremap <Leader>bo :BufOnly<CR>
-- delete trailing whitespace 
nnoremap <Leader>dw :%s/\s\+$//e<CR>
-- fold za using space
nnoremap <silent> <space> @=(foldlevel('.')?'za':"\<Space>")<CR>
nnoremap <C-@> VG:normal @q<CR>
------------------------windows/buffers/panes-----------------------------------
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
