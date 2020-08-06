set encoding=UTF-8

" Remove toolbar and scrollbars from gVim,
set guioptions-=T
set guioptions-=r
set guioptions-=l
set guioptions-=L
set guioptions-=R

nnoremap <leader>r :ProjectRootExe RangerFiles<CR>
" Add Vim icon to window, where it is shown depends on platform, windowing
" system, X11 server depth, etc etc.
set guioptions+=i

" Automagically yank to windowing system clipboard on visual select.
set guioptions+=a

" colorscheme to use for GUI
"set background=dark
colorscheme dracula
"colorscheme gruvbox
set antialias " Use smooth, antialiased fonts (OS X Specific)
set guifont=SauceCodeProNerdFontCo-Regular:h13


" MacVim specific: Set fullscreen options to be as full screen as possible
if has("gui_macvim")
    set fuoptions=maxhorz,maxvert
endif

" Set semi-sensible default window sizes for gui
if has('gui_running')
    set lines=88 " Yes 54 lines is completely arbitrary.
    set columns=800 " I like some extra horizontal space by default.
                    " For some reason it helps me focus, and not everyone
                    " aligns their code to 80 columns.
endif

" Technically, according to the documentation
" (try :help mousehide if you think I'm a filthy liar)
" The default behavior in the gui is to hide the mouse pointer
" when you are typing, and bring it back once you stop.
" On my system it's just always gone forever.
" So, we remedy this.
"set nomousehide

" 'Config changed' autocmd hook
autocmd BufWritePost $MYGVIMRC let g:needrestart = 1

" Attempt to source .gvimrc.local for very machine-specific configurations that
" would benefit absolutely no one by being here. Mostly bug workarounds.
if filereadable(expand('~/.gvimrc.local'))
    source ~/.gvimrc.local
endif

