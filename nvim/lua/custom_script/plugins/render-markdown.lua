-- In your lazy.nvim configuration file (usually init.lua or plugins.lua)
return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("render-markdown").setup({
				heading = {
					enabled = true,
					sign = true,
					position = "overlay",
					icons = { "① ", "② ", "③ ", "④ ", "⑤ ", "⑥ " },
					signs = { "󰫎 " },
					width = "full",
					left_margin = 0,
					left_pad = 0,
					right_pad = 0,
					min_width = 70,
					border = true,
					border_virtual = false,
					border_prefix = true,
					above = "▄",
					below = "▀",
					backgrounds = {
						"RenderMarkdownH1Bg",
						"RenderMarkdownH2Bg",
						"RenderMarkdownH3Bg",
						"RenderMarkdownH4Bg",
						"RenderMarkdownH5Bg",
						"RenderMarkdownH6Bg",
					},
					foregrounds = {
						"RenderMarkdownH1",
						"RenderMarkdownH2",
						"RenderMarkdownH3",
						"RenderMarkdownH4",
						"RenderMarkdownH5",
						"RenderMarkdownH6",
					},
				},
			})
		end,
	},
}
