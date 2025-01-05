local user_preferences = {

	name = "kanagawa",
	style = "dragon", -- wave/lotus/dragon
	transparent = false,

	--name = "everforest",
	--style = "medium", --soft/medium/hard
	--transparent = false,

	--name = "catppuccin",
	--style = "mocha", --latte/frappe/macchiato/mocha
	--transparent = false,

	--name = "tokyonight",
	--style = "night", --night/storm/day/moon
	--transparent = true,

	--name = "rose-pine",
	--style = "main", -- main/moon/dawn
	--transparent = false,
}

return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
	},
	{
		"neanias/everforest-nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = false,
		priority = 1000,
		config = function()
			local theme = user_preferences.name
			local style = user_preferences.style
			local transparent = user_preferences.transparent

			if theme == "kanagawa" then
				require("kanagawa").setup({
					theme = style,
					transparent = transparent,
				})
			elseif theme == "tokyonight" then
				local bg = "#011628"
				local bg_dark = "#011423"
				local bg_highlight = "#143652"
				local bg_search = "#0A64AC"
				local bg_visual = "#275378"
				local fg = "#CBE0F0"
				local fg_dark = "#B4D0E9"
				local fg_gutter = "#627E97"
				local border = "#547998"

				require("tokyonight").setup({
					style = style,
					transparent = transparent,
					styles = {
						sidebars = transparent and "transparent" or "dark",
						floats = transparent and "transparent" or "dark",
					},
					on_colors = function(colors)
						colors.bg = bg
						colors.bg_dark = transparent and colors.none or bg_dark
						colors.bg_float = transparent and colors.none or bg_dark
						colors.bg_highlight = bg_highlight
						colors.bg_popup = bg_dark
						colors.bg_search = bg_search
						colors.bg_sidebar = transparent and colors.none or bg_dark
						colors.bg_statusline = transparent and colors.none or bg_dark
						colors.bg_visual = bg_visual
						colors.border = border
						colors.fg = fg
						colors.fg_dark = fg_dark
						colors.fg_float = fg
						colors.fg_gutter = fg_gutter
						colors.fg_sidebar = fg_dark
					end,
				})
			elseif theme == "catppuccin" then
				require("catppuccin").setup({
					flavour = style,
					transparent_background = transparent,
				})
			elseif theme == "everforest" then
				require("everforest").setup({
					background = style,
					transparent_background_level = transparent and 2 or 0,
				})
			elseif theme == "rose-pine" then
				require("rose-pine").setup({
					variant = style,
					dark_variant = "main",
					styles = {
						transparency = transparent,
					},
				})
			end

			vim.cmd.colorscheme(theme)
		end,
	},
}

--local user_preferences = {
--	--name = "kanagawa",
--	--style = "dragon", -- wave/lotus/dragon
--	--transparent = false,
--
--	--name = "everforest",
--	--style = "medium", --soft/medium/hard
--	--transparent = false,
--
--	name = "catppuccin",
--	style = "mocha", --latte/frappe/macchiato/mocha
--	transparent = false,
--
--	--name = "tokyonight",
--	--style = "night", --night/storm/day/moon
--	--transparent = true,
--}
--
--return {
--	{
--		"folke/tokyonight.nvim",
--		lazy = false,
--		priority = 1000,
--	},
--	{
--		"catppuccin/nvim",
--		name = "catppuccin",
--		lazy = false,
--		priority = 1000,
--	},
--	{
--		"neanias/everforest-nvim",
--		lazy = false,
--		priority = 1000,
--	},
--	{
--		"rebelot/kanagawa.nvim",
--		lazy = false,
--		priority = 1000,
--		config = function()
--			local theme = user_preferences.name
--			local style = user_preferences.style
--			local transparent = user_preferences.transparent
--
--			if theme == "kanagawa" then
--				require("kanagawa").setup({
--					theme = style,
--					transparent = transparent,
--				})
--			elseif theme == "tokyonight" then
--				local bg = "#011628"
--				local bg_dark = "#011423"
--				local bg_highlight = "#143652"
--				local bg_search = "#0A64AC"
--				local bg_visual = "#275378"
--				local fg = "#CBE0F0"
--				local fg_dark = "#B4D0E9"
--				local fg_gutter = "#627E97"
--				local border = "#547998"
--
--				require("tokyonight").setup({
--					style = style,
--					transparent = transparent,
--					styles = {
--						sidebars = transparent and "transparent" or "dark",
--						floats = transparent and "transparent" or "dark",
--					},
--					on_colors = function(colors)
--						colors.bg = bg
--						colors.bg_dark = transparent and colors.none or bg_dark
--						colors.bg_float = transparent and colors.none or bg_dark
--						colors.bg_highlight = bg_highlight
--						colors.bg_popup = bg_dark
--						colors.bg_search = bg_search
--						colors.bg_sidebar = transparent and colors.none or bg_dark
--						colors.bg_statusline = transparent and colors.none or bg_dark
--						colors.bg_visual = bg_visual
--						colors.border = border
--						colors.fg = fg
--						colors.fg_dark = fg_dark
--						colors.fg_float = fg
--						colors.fg_gutter = fg_gutter
--						colors.fg_sidebar = fg_dark
--					end,
--				})
--			elseif theme == "catppuccin" then
--				require("catppuccin").setup({
--					flavour = style,
--					transparent_background = transparent,
--				})
--			elseif theme == "everforest" then
--				require("everforest").setup({
--					background = style,
--					transparent_background_level = transparent and 2 or 0,
--				})
--			end
--
--			vim.cmd.colorscheme(theme)
--		end,
--	},
--}
