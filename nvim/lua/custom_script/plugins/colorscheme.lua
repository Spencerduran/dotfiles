return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = false,
		priority = 1000,
		config = function()
			require("rose-pine").setup({
				variant = "main", -- matches ghostty + obsidian
				dark_variant = "main",
				styles = {
					bold = true,
					italic = true,
					transparency = true, -- let ghostty's background show through
				},
			})

			vim.cmd.colorscheme("rose-pine")
		end,
	},
	{ "folke/tokyonight.nvim", lazy = true },
	{ "catppuccin/nvim", name = "catppuccin", lazy = true },
	{ "neanias/everforest-nvim", lazy = true },
	{ "rebelot/kanagawa.nvim", lazy = true },
}
