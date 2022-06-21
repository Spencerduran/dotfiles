local settings = require("user-conf")
--local utils = require("functions")
local o = vim.opt -- For :setglobal
local wo = vim.wo -- For :setlocal
local fn = vim.fn	-- To call autoload functions - ie: vim.fn['some#function']({...})

o.background = dark
o.backspace      = "indent,eol,start" -- Allow backspace over everything in insert mode
o.clipboard      = "unnamed" -- Allows neovim to access the system clipboard
o.cmdheight      = 1 -- Space for displaying messages/commands
--o.colorcolumn    = "80" -- Set colorcolumn at C80
o.completeopt    = { "menu", "menuone", "noselect", "noinsert" } -- A comma separated list of options for Insert mode completion
o.conceallevel   = 0 -- Dont hide symbols in MD and JSON
wo.cursorline     = true -- Highlight the current line
o.encoding       = "UTF-8" -- Set global encoding to UTF-8
o.expandtab      = true -- Convert tabs to spaces
o.foldenable     = false -- Disable folding; enable with zi
o.hidden         = true -- Opening a new file when current buffer has unsaved changes causes files to be hidden instead of closed
o.history        = 500 -- Sets the number of lines that command mode remembers
o.hlsearch       = true -- Highlight all matches on previous search pattern
o.ignorecase     = true -- Ignore case in search patterns
o.incsearch      = true -- Incremental search
o.lazyredraw     = true -- Do not redraw screen while running macros
o.listchars      = "tab:..,trail:_,extends:>,precedes:<,nbsp:~,eol:$,space:_" -- Define whitespace characters
o.mouse          = n -- Set mouse mode for terminal window resizing
o.swapfile       = false -- Disable .swp files
o.relativenumber = settings.relative_number	-- Set relative line numbers
o.scrolloff      = 8 -- Minimum number of screen lines to keep above and below the cursor.
o.shell          = fish -- Set shell
o.shiftwidth     = 2 -- The number of spaces inserted for each indentation
o.shortmess      = o.shortmess + "c" -- Prevent "pattern not found" messages
o.showmode       = false -- Hide statusline info
o.showtabline    = 2 -- Always show tabs
o.sidescrolloff  = 5 -- The minimal number of columns to scroll horizontally
o.smartcase      = true -- Smart case
o.smartindent    = true -- Make indenting smart again
o.splitbelow     = true -- Force all horizontal splits to go below current window
o.splitright     = true -- Force all vertical splits to go to the right of current window
o.tabstop        = 2 -- How many columns a tab counts for
o.termguicolors  = true -- Set term gui colors
o.title          = true -- Show filename in titlebar of window
o.wildmenu       = true -- Enhanced command-line completion
o.wildmode       = "longest:full" -- Complete till longest common string + 'wildmenu' if it is enabled.
o.wildignorecase = true -- When set case is ignored when completing file names and directories
o.wildignore = [[
.git,.hg,.svn
*.aux,*.out,*.toc
*.o,*.obj,*.exe,*.dll,*.manifest,*.rbc,*.class
*.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp
*.avi,*.divx,*.mp4,*.webm,*.mov,*.m2ts,*.mkv,*.vob,*.mpg,*.mpeg
*.mp3,*.oga,*.ogg,*.wav,*.flac
*.eot,*.otf,*.ttf,*.woff
*.doc,*.pdf,*.cbr,*.cbz
*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz,*.kgb
*.swp,.lock,.DS_Store,._*
*/tmp/*,*.so,*.swp,*.zip,**/node_modules/**,**/target/**,**.terraform/**"
]]
if settings.global_statusline then
	o.laststatus = 3 -- always and ONLY the last window
else
	o.laststatus = 2 -- always
end
-- o.foldexpr = "nvim_treesitter#foldexpr()"
-- o.foldmethod = "expr"
