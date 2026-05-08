return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			local bg = "#111111"
			local bg_dark = "#0d0d0d"
			local bg_highlight = "#21222c"
			local bg_search = "#bd93f9"
			local bg_visual = "#44475a"
			local fg = "#f8f8f2"
			local fg_dark = "#e0e0e0"
			local fg_gutter = "#6272a4"
			local border = "#bd93f9"

			require("tokyonight").setup({
				style = "night",
				transparent = true,
				styles = {
					sidebars = "transparent",
					floats = "transparent",
				},
				on_colors = function(colors)
					colors.bg = bg
					colors.bg_dark = colors.none
					colors.bg_float = colors.none
					colors.bg_highlight = bg_highlight
					colors.bg_popup = bg_dark
					colors.bg_search = bg_search
					colors.bg_sidebar = colors.none
					colors.bg_statusline = colors.none
					colors.bg_visual = bg_visual
					colors.border = border
					colors.fg = fg
					colors.fg_dark = fg_dark
					colors.fg_float = fg
					colors.fg_gutter = fg_gutter
					colors.fg_sidebar = fg_dark
					colors.blue = "#bd93f9"
					colors.cyan = "#8be9fd"
					colors.magenta = "#ff79c6"
					colors.purple = "#bd93f9"
					colors.yellow = "#f1fa8c"
					colors.green = "#50fa7b"
					colors.orange = "#ffb86c"
					colors.red = "#ff5555"
				end,
			})

			vim.cmd.colorscheme("tokyonight")
		end,
	},
	{ "catppuccin/nvim", name = "catppuccin", lazy = true },
	{ "neanias/everforest-nvim", lazy = true },
	{ "rebelot/kanagawa.nvim", lazy = true },
	{ "rose-pine/neovim", name = "rose-pine", lazy = true },
}
