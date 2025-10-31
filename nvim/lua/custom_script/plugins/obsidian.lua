return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = true,
	ft = "markdown",
	dependencies = {
		-- Required.
		"nvim-lua/plenary.nvim",
		"hrsh7th/nvim-cmp",
		"nvim-telescope/telescope.nvim",
	},
	opts = {

		ui = {
			enable = false,
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
		daily_notes = {
			folder = "400 Daily Notes",
			date_format = "%Y-%m-%d",
			alias_format = "%B %-d, %Y",
			template = "Daily Note Template.md",
		},
		completion = {
			nvim_cmp = true,
			min_chars = 2,
		},
	},
}
