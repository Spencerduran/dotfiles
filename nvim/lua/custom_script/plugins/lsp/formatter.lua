return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	config = function()
		require("conform").setup({
			-- Define formatters by filetype
			formatters_by_ft = {
				-- Catch-all formatter for languages that share formatters
				["*"] = { "trim_whitespace", "trim_newlines" },
				-- Web development
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				svelte = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				--markdown = { "prettier" },
				graphql = { "prettier" },
				-- Python
				python = { "isort", "black" },
				-- Lua
				lua = { "stylua" },
				-- SQL - with no arguments
				sql = { "sql_formatter" },
				-- Shell
				sh = { "shfmt" },
			},
			-- Set up format-on-save
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
		})
		-- Keymaps
		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			require("conform").format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
