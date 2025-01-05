return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = false,
	ft = "markdown",
	event = {
		-- Load when opening a file in your vault directory
		"BufReadPre ~/Documents/second_brain/**.md",
		-- Load for new files in your vault directory
		"BufNewFile ~/Documents/second_brain/**.md",
		-- If you still want it for other markdown files:
		"FileType markdown",
	},
	dependencies = {
		-- Required.
		"nvim-lua/plenary.nvim",
		"hrsh7th/nvim-cmp",
		"nvim-telescope/telescope.nvim",
	},
	opts = {

		--workspaces = {
		--	{
		--		name = "second_brain",
		--		path = "~/Documents/second_brain",
		--	},
		--	{
		--		name = "no-vault",
		--		path = function()
		--			return assert(vim.fs.dirname(vim.api.nvim_buf_get_name(0)))
		--			-- alternatively use the CWD:
		--			-- return assert(vim.fn.getcwd())
		--		end,
		--		overrides = {
		--			notes_subdir = vim.NIL, -- have to use 'vim.NIL' instead of 'nil'
		--			new_notes_location = "current_dir",
		--			templates = {
		--				folder = vim.NIL,
		--			},
		--			disable_frontmatter = true,
		--		},
		--	},
		--},
		workspaces = {
			{
				name = "second_brain",
				path = "~/Documents/second_brain",
			},
			{
				name = "no-vault",
				path = function()
					local current_file = vim.api.nvim_buf_get_name(0)
					-- Only use no-vault if we're not in the second_brain directory
					if not string.match(current_file, "second_brain") then
						return assert(vim.fs.dirname(current_file))
					end
					return nil
				end,
				overrides = {
					notes_subdir = vim.NIL,
					new_notes_location = "current_dir",
					templates = {
						folder = vim.NIL,
					},
					disable_frontmatter = true,
				},
			},
		},
		notes_subdir = "000 Inbox",
		templates = {
			subdir = "300 Resources/Templates",
			date_format = "%Y-%m-%d",
			time_format = "%H:%M",
		},
		completion = {
			nvim_cmp = true,
			min_chars = 2,
		},
		detect_cwd = false,
	},
}
