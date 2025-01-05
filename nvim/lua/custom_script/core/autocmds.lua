local api = vim.api
--local settings = require("user-conf")
--local funx = require("functions")

--------------------------------------------------
-- Enable highlight for .wiki files
--------------------------------------------------
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = { "*.wiki" },
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
