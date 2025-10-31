return {
	"dhruvasagar/vim-table-mode",
	ft = { "markdown", "org" },
	config = function()
		-- Enable table mode for markdown by default
		vim.g.table_mode_corner = "|"

		-- Markdown-compatible table corners
		vim.g.table_mode_corner_corner = "|"
		vim.g.table_mode_header_fillchar = "-"

		-- Auto format tables as you type
		vim.g.table_mode_auto_align = 1

		-- Keymaps (only in markdown files)
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "markdown",
			callback = function()
				-- Toggle table mode with <leader>tm
				vim.keymap.set(
					"n",
					"<leader>tm",
					":TableModeToggle<CR>",
					{ buffer = true, desc = "Toggle table mode", silent = true }
				)

				-- Tableize selection (convert CSV to table)
				vim.keymap.set(
					"v",
					"<leader>tt",
					":Tableize<CR>",
					{ buffer = true, desc = "Tableize selection", silent = true }
				)
			end,
		})
	end,
}
