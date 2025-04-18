--return {
--	"nvim-treesitter/nvim-treesitter",
--	event = { "BufReadPre", "BufNewFile" },
--	build = ":TSUpdate",
--	dependencies = {
--		"windwp/nvim-ts-autotag",
--	},
--	config = function()
--		-- import nvim-treesitter plugin
--		local treesitter = require("nvim-treesitter.configs")
--
--		-- configure treesitter
--		treesitter.setup({ -- enable syntax highlighting
--			TSconfig = {
--				rainbow = {
--					enable = true,
--					extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
--					max_file_lines = 2000, -- Do not enable for files with more than specified lines
--				},
--				highlight = {
--					enable = true,
--					additional_vim_regex_highlighting = false,
--				},
--				-- enable indentation
--				indent = { enable = true },
--				-- enable autotagging (w/ nvim-ts-autotag plugin)
--				autotag = {
--					enable = true,
--				},
--				-- ensure these language parsers are installed
--				ensure_installed = {
--					"bash",
--					"c",
--					"dockerfile",
--					"gitignore",
--					"graphql",
--					"html",
--					"javascript",
--					"json",
--					"lua",
--					"norg",
--					"markdown",
--					"markdown_inline",
--					"query",
--					"sql",
--					"svelte",
--					"tsx",
--					"typescript",
--					"vim",
--					"vimdoc",
--					"yaml",
--				},
--				incremental_selection = {
--					enable = true,
--					keymaps = {
--						init_selection = "<C-space>",
--						node_incremental = "<C-space>",
--						scope_incremental = false,
--						node_decremental = "<bs>",
--					},
--				},
--			},
--		})
--		vim.treesitter.language.register("markdown")
--	end,
--}
return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	config = function()
		-- import nvim-treesitter plugin
		local treesitter = require("nvim-treesitter.configs")
		-- configure treesitter
		treesitter.setup({
			-- Remove the TSconfig nesting
			rainbow = {
				enable = true,
				extended_mode = true,
				max_file_lines = 2000,
			},
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = { enable = true },
			autotag = {
				enable = true,
			},
			ensure_installed = {
				"bash",
				"c",
				"dockerfile",
				"gitignore",
				"graphql",
				"html",
				"javascript",
				"json",
				"lua",
				"norg",
				"markdown",
				"markdown_inline",
				"query",
				"sql",
				"svelte",
				"tsx",
				"typescript",
				"vim",
				"vimdoc",
				"yaml",
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
		})
		vim.treesitter.language.register("markdown")
	end,
}
