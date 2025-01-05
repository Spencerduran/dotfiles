return {
	"voldikss/vim-floaterm",
	lazy = true,
	cmd = { "FloatermNew", "FloatermToggle" },
	keys = {
		{ "<leader>ft", "<cmd>FloatermToggle<cr>", desc = "Toggle Terminal" },
	},
	config = function()
		vim.g.floaterm_width = 0.8
		vim.g.floaterm_height = 0.8
		vim.g.floaterm_position = "center"
	end,
}
