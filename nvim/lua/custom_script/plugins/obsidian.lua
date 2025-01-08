return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = false,
	ft = "markdown",
	event = {
		-- Load when opening a file in your vault directory
		"BufReadPre ~/vaults/second_brain/**.md",
		-- Load for new files in your vault directory
		"BufNewFile ~/vaults/second_brain/**.md",
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

		ui = {
			enable = true,
			update_debounce = 200,
			checkboxes = {
				-- Remove the checkbox prefix before displaying
				[" "] = { char = "☐", hl_group = "ObsidianTodo" },
				["x"] = { char = "☑", hl_group = "ObsidianDone" },
				[">"] = { char = "", hl_group = "ObsidianRightArrow" },
				["~"] = { char = "☒", hl_group = "ObsidianTilde" },
			},
			bullets = { char = "-  ", hl_group = "ObsidianBullet", padding = " " },
			external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
			reference_text = { hl_group = "ObsidianRefText" },
			highlight_text = { hl_group = "ObsidianHighlightText" },
			tags = { hl_group = "ObsidianTag" },
			hl_groups = {
				-- Highlight groups for different elements
				ObsidianTodo = { bold = true, fg = "#f78c6c" },
				ObsidianDone = { bold = true, fg = "#89ddff" },
				ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
				ObsidianTilde = { bold = true, fg = "#ff5370" },
				ObsidianBullet = { bold = false, fg = "#89ddff" },
				ObsidianRefText = { underline = true, fg = "#c792ea" },
				ObsidianExtLinkIcon = { fg = "#c792ea" },
				ObsidianTag = { italic = true, fg = "#89ddff" },
				ObsidianHighlightText = { bg = "#75662e" },
			},
		},
		workspaces = {
			{
				name = "second_brain",
				path = "~/vaults/second_brain",
				notes_subdir = "000 Inbox",
				new_notes_location = "notes_subdir",
			},
			{
				name = "no-vault",
				path = function()
					local current_file = vim.api.nvim_buf_get_name(0)
					if current_file == "" then
						return nil
					end
					-- Only use no-vault if not in an obsidian vault directory
					if not string.match(current_file, "second_brain") then
						local dir = vim.fs.dirname(current_file)
						return dir and dir or nil
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
		-- Note titles as titles instead of unique IDs
		note_id_func = function(title)
			return title
		end,
		templates = {
			subdir = "300 Resources/Templates",
			date_format = "%Y-%m-%d",
			time_format = "%H:%M",
		},
		completion = {
			nvim_cmp = true,
			min_chars = 2,
		},
	},
}
