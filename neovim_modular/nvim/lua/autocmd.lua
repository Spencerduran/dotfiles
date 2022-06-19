local api = vim.api
local settings = require("user-conf")

-- Don't auto comment new line
api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })

-- Update CWD to current file on entering buffer
api.nvim_create_autocmd("BufEnter", { command = [[silent! lcd %:p:h]] })

-- Highlight on yank
local yankGrp = api.nvim_create_augroup("YankHighlight", { clear = true })
api.nvim_create_autocmd("TextYankPost", {
	command = "silent! lua vim.highlight.on_yank()",
	group = yankGrp,
})

-- go to last loc when opening a buffer
api.nvim_create_autocmd(
	"BufReadPost",
	{ command = [[if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif]] }
)
-- windows to close with "q"
api.nvim_create_autocmd(
	"FileType",
	{ pattern = { "help", "startuptime", "qf", "lspinfo" }, command = [[nnoremap <buffer><silent> q :close<CR>]] }
)
api.nvim_create_autocmd("FileType", { pattern = "man", command = [[nnoremap <buffer><silent> q :quit<CR>]] })

-- Enable spell checking for certain file types
api.nvim_create_autocmd(
	{ "BufRead", "BufNewFile" },
	{ pattern = { "*.txt", "*.md", "*.tex" }, command = "setlocal spell" }
)

-- source plugins.lua and run PackerSync on save
if settings.packer_auto_sync then
	local sync_packer = function()
		vim.cmd("runtime lua/plugins.lua")
		require("packer").sync()
	end
	api.nvim_create_autocmd({ "BufWritePost" }, {
		pattern = { "plugins.lua" },
		callback = sync_packer,
	})
end
