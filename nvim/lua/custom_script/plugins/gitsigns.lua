return {
	"lewis6991/gitsigns.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		signs = {
			add = { text = "│" },
			change = { text = "│" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
		},
		current_line_blame = true,
		signcolumn = true,
	},
	config = function(_, opts)
		-- Set up highlight groups
		vim.api.nvim_set_hl(0, "GitSignsAdd", { link = "GitSignsAdd" })
		vim.api.nvim_set_hl(0, "GitSignsChange", { link = "GitSignsChange" })
		vim.api.nvim_set_hl(0, "GitSignsDelete", { link = "GitSignsDelete" })
		-- Setup gitsigns with the options
		require("gitsigns").setup(opts)
	end,
}
