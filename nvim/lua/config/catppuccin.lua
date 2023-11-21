local catpuccin = require("catppuccin").setup({
	integrations = {
		notify = true,
		dashboard = true,
		which_key = true,
		neotree = {
			enabled = true,
			show_root = false,
			transparent_panel = false,
		},
		gitgutter = true,
		telescope = true,
		cmp = true,
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" },
			},
			underlines = {
				errors = { "underline" },
				hints = { "underline" },
				warnings = { "underline" },
				information = { "underline" },
			},
		},
	},
})

--vim.g.catppuccin_flavour = "frappe" -- latte, frappe, macchiato, mocha
--vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha
vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
vim.cmd([[colorscheme catppuccin]])
