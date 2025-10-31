return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
	ft = "markdown",
	opts = {
		-- Render styles
		heading = {
			-- Turn on / off heading icon & background
			enabled = true,
			-- Replaces '#+' of headings
			icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
			-- Background highlight to use for headings
			backgrounds = {
				"RenderMarkdownH1Bg",
				"RenderMarkdownH2Bg",
				"RenderMarkdownH3Bg",
				"RenderMarkdownH4Bg",
				"RenderMarkdownH5Bg",
				"RenderMarkdownH6Bg",
			},
		},
		code = {
			-- Turn on / off code block rendering
			enabled = true,
			-- Highlight for code blocks
			style = "full",
		},
		bullet = {
			-- Turn on / off list bullet rendering
			enabled = true,
			-- Replaces '-'|'+'|'*' of unordered lists
			icons = { "●", "○", "◆", "◇" },
		},
		checkbox = {
			-- Turn on / off checkbox rendering
			enabled = true,
			unchecked = { icon = "󰄱 " },
			checked = { icon = "󰱒 " },
		},
	},
}
