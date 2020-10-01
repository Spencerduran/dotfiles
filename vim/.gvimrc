set encoding=UTF-8
set noerrorbells "no error bells
set vb t_vb= "no error bells
" Remove toolbar and scrollbars from gVim,
set guioptions-=T
set guioptions-=r
set guioptions-=l
set guioptions-=L
set guioptions-=R

"macvim specific way to call ranger
nnoremap <leader>r :ProjectRootExe RangerFiles<CR>

" Add Vim icon to window, where it is shown depends on platform, windowing
" system, X11 server depth, etc etc.
set guioptions+=i

" Automagically yank to windowing system clipboard on visual select.
set guioptions+=a

" colorscheme to use for GUI
colorscheme dracula
"colorscheme gruvbox
set antialias " Use smooth, antialiased fonts
"set guifont=DroidSansMonoForPowerlinePlusNerdFileTypesMono:h12
set guifont=Iosevka\ Nerd\ Font\ Complete\ Mono:h14

" MacVim specific: Set fullscreen options to be as full screen as possible
if has("gui_macvim")
    set fuoptions=maxhorz,maxvert
endif
