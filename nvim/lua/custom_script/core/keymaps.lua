local map = vim.keymap.set
local default_options = { silent = true }
--local expr_options = { expr = true, silent = true }

-- Remap space as leader key
map({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

--------------------------------------------------
---------- Normal ------------
--------------------------------------------------
-- Toggle whitespace characters
map("n", "<F1>", "set list!<CR>", default_options)

-- Delete trailing whitespace
map("n", "<Leader>dw", ":%s/\\s\\+$//e<CR>", default_options)

-- Cancel search highlighting with ESC
map("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", default_options)

---- Copy current buffer file path to clipboard
map("n", "<Leader>cp", ":let @+=expand('%:p')<CR>", default_options)

---- Remove  carraige return (^M) symbols
map("n", "<Leader>cr", "%s/\\r//g<CR>", default_options)

-- Window Nav
map("n", "<C-h>", "<C-w>h", default_options)
map("n", "<C-j>", "<C-w>j", default_options)
map("n", "<C-k>", "<C-w>k", default_options)
map("n", "<C-l>", "<C-w>l", default_options)

-- Resize with arrows
map("n", "<Up>", ":resize -2<CR>", default_options)
map("n", "<Down>", ":resize +2<CR>", default_options)
map("n", "<Left>", ":vertical resize -2<CR>", default_options)
map("n", "<Right>", ":vertical resize +2<CR>", default_options)

-- Navigate buffers
map("n", "<S-l>", ":bnext<CR>", default_options)
map("n", "<S-h>", ":bprevious<CR>", default_options)

--------------------------------------------------
------------ Insert ------------
--------------------------------------------------
-- Press jk fast to enter normal
map("i", "jk", "<ESC>", default_options)

-- move to a closing element in insert mode
map("i", "<C-l>", function()
	return require("functions").escapePair()
end, default_options)
--------------------------------------------------
------------ Visual ------------
--------------------------------------------------
-- Indent selected
map("v", "<", "<gv", default_options)
map("v", ">", ">gv", default_options)
