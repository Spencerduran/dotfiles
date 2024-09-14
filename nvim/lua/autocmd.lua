local api = vim.api
local settings = require("user-conf")
local funx = require("functions")


vim.api.nvim_create_augroup('alpha_on_empty', { clear = true })
vim.api.nvim_create_autocmd('User', {
  pattern = 'BDeletePre',
  group = 'alpha_on_empty',
  callback = function(event)
    local found_non_empty_buffer = false
    buffers = funx.get_listed_buffers()

    for _, bufnr in ipairs(buffers) do
      if not found_non_empty_buffer then
        local name = vim.api.nvim_buf_get_name(bufnr)
        local ft = vim.api.nvim_buf_get_option(bufnr, 'filetype')

        if bufnr ~= event.buf and name ~= '' and ft ~= 'Alpha' then
          found_non_empty_buffer = true
        end
      end
    end

    if not found_non_empty_buffer then
      vim.cmd [[:Alpha]]
    end
  end,
})

-- Enter word process mode when entering .txt and .wiki files

--map j gj
--map k gk
api.nvim_command([[
autocmd BufEnter *.wiki :set wrap linebreak nolist spell noexpandtab formatoptions=1
augroup END 
]])

-- Enter word process mode when entering .txt and .wiki files
--api.nvim_create_autocmd({"BufEnter"}, { pattern = {"*.wiki", "*.txt"}, command = "set wrap linebreak nolist spell noexpandtab formatoptions=1"})

-- Don't auto comment new line
api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })

-- Update CWD to current file on entering buffer
--api.nvim_create_autocmd("BufEnter", { command = [[silent! lcd %:p:h]] })

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

