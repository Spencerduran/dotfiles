local api = vim.api
--local settings = require("user-conf")
--local funx = require("functions")

--------------------------------------------------
-- Exit nvim when tree is last buffer
--------------------------------------------------
vim.api.nvim_create_autocmd("BufEnter", {
	group = vim.api.nvim_create_augroup("NvimTreeClose", { clear = true }),
	callback = function()
		local layout = vim.api.nvim_call_function("winlayout", {})
		if layout[1] == "leaf" and vim.bo.filetype == "NvimTree" and layout[2] == vim.api.nvim_get_current_win() then
			vim.cmd("confirm quit")
		end
	end,
})
--------------------------------------------------
-- Word processor mode for Obsidian files
--------------------------------------------------
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = { "*.md" }, -- Match markdown files
	callback = function()
		-- Check if this is an Obsidian buffer (you might want to check path contains your vault)
		local file_path = vim.fn.expand("%:p")
		if string.find(file_path, "Obsidian") then -- Adjust this to match your vault path
			-- Set your preferences
			vim.b.formatoptions = 1
			vim.b.expandtab = false
			vim.wo.wrap = true
			vim.wo.linebreak = true
			vim.wo.spell = true

			-- Set up your keymaps
			vim.keymap.set({ "n", "v" }, "j", "gj", { buffer = true, silent = true })
			vim.keymap.set({ "n", "v" }, "k", "gk", { buffer = true, silent = true })
		end
	end,
	desc = "Set up Obsidian markdown preferences",
})
--------------------------------------------------
-- Enable highlight for .wiki files
--------------------------------------------------
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = { "*.md" },
	callback = function()
		vim.cmd("TSBufEnable highlight")
	end,
})
--------------------------------------------------
-- Make help files open in a vertical split
--------------------------------------------------
vim.api.nvim_create_autocmd("FileType", {
	pattern = "help",
	callback = function()
		vim.cmd("wincmd L")
	end,
})
--------------------------------------------------
-- Don't auto comment new line
--------------------------------------------------
api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })
--------------------------------------------------
-- Update CWD to current file on entering buffer
--------------------------------------------------
api.nvim_create_autocmd("BufEnter", { command = [[silent! lcd %:p:h]] })
--------------------------------------------------
-- Return to Alpha.nvim when exiting last open buffer
--------------------------------------------------
vim.api.nvim_create_augroup("alpha_on_empty", { clear = true })
vim.api.nvim_create_autocmd("User", {
	pattern = "BDeletePost*",
	group = "alpha_on_empty",
	callback = function(event)
		local fallback_name = vim.api.nvim_buf_get_name(event.buf)
		local fallback_ft = vim.api.nvim_buf_get_option(event.buf, "filetype")
		local fallback_on_empty = fallback_name == "" and fallback_ft == ""

		if fallback_on_empty then
			vim.cmd("Alpha")
		end
	end,
})
--------------------------------------------------
-- Highlight on yank
--------------------------------------------------
local yankGrp = api.nvim_create_augroup("YankHighlight", { clear = true })
api.nvim_create_autocmd("TextYankPost", {
	command = "silent! lua vim.highlight.on_yank()",
	group = yankGrp,
})
--------------------------------------------------
-- Go to last loc when opening a buffer
--------------------------------------------------
api.nvim_create_autocmd(
	"BufReadPost",
	{ command = [[if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif]] }
)
--------------------------------------------------
-- Close some windows with "q"
--------------------------------------------------
api.nvim_create_autocmd(
	"FileType",
	{ pattern = { "help", "startuptime", "qf", "lspinfo" }, command = [[nnoremap <buffer><silent> q :close<CR>]] }
)
api.nvim_create_autocmd("FileType", { pattern = "man", command = [[nnoremap <buffer><silent> q :quit<CR>]] })
--------------------------------------------------
-- Enable spell checking for certain file types
--------------------------------------------------
api.nvim_create_autocmd(
	{ "BufRead", "BufNewFile" },
	{ pattern = { "*.txt", "*.md", "*.tex" }, command = "setlocal spell" }
)
