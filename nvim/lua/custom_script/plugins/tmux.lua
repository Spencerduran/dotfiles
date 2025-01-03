return {
	"aserowy/tmux.nvim",
	config = function()
		require("tmux").setup({
			copy_sync = {
				enable = true,
				redirect_to_clipboard = true,
				register_offset = 0,
				sync_clipboard = false,
				sync_deletes = true,
			},
			navigation = { enable_default_keybindings = true },
			resize = { enable_default_keybindings = true },
		})
	end,
	event = "VeryLazy",
}
