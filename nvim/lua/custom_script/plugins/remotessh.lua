return {
	"nosduco/remote-sshfs.nvim",
	event = "VeryLazy",
	config = function()
		require("remote-sshfs").setup({})
		require("telescope").load_extension("remote-sshfs")
	end,
	dependencies = { "nvim-telescope/telescope.nvim" },
}
