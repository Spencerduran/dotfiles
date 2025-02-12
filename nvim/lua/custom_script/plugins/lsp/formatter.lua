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

				-- SQL
				sql = { "sql_formatter" },

				-- Shell
				sh = { "shfmt" },
			},

			-- Set up format-on-save
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},

			-- Use LSP formatting if available (useful as fallback)
			formatters = {
				-- You can add custom formatter configurations here
				sql_formatter = {
					-- Optional: specify command arguments
					args = { "--config", "~/.config/sql-formatter/config.json" },
				},
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
