-- Option 1: Combined config with notify setup after noice
return {
	"folke/noice.nvim",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	version = "*",
	config = function()
		-- First setup noice
		require("noice").setup({
			cmdline = {
				enabled = true,
				view = "cmdline_popup",
			},
			messages = {
				-- Message timeout configuration
				enabled = true,
				view = "notify",
				view_error = { timeout = 10000 }, -- 10s for errors
				view_warn = { timeout = 7000 }, -- 7s for warnings
				view_history = { timeout = 5000 }, -- 5s for history
				view_search = { timeout = 5000 }, -- 5s for search messages
			},
			popupmenu = {
				enabled = true,
				backend = "nui",
			},
			notify = {
				enabled = true,
				view = "notify",
			},
			lsp = {
				message = {
					enabled = true,
					view = "notify",
					opts = {
						timeout = 8000, -- 8s for LSP messages
					},
				},
			},
			markdown = {
				enabled = true,
				hover = {
					enabled = true,
				},
			},
			health = {
				checker = true,
			},
			smart_move = {
				enabled = true,
				excluded_filetypes = { "cmp_menu", "cmp_docs", "notify" },
			},
			presets = {
				bottom_search = false,
				command_palette = false,
				long_message_to_split = true,
				inc_rename = false,
				lsp_doc_border = false,
			},
			throttle = 1000 / 30,
			views = {
				notify = {
					stages = "fade_in_slide_out",
					timeout = 5000,
					background_colour = "#000000",
					minimum_width = 50,
				},
				cmdline_popup = {
					position = {
						row = 17,
						col = "50%",
					},
					size = {
						width = 60,
						height = "auto",
					},
				},
				popupmenu = {
					relative = "editor",
					position = {
						row = 20,
						col = "50%",
					},

					size = {
						width = 60,
						height = 10,
					},
					border = {
						style = "rounded",
						padding = { 0, 1 },
					},
					win_options = {
						winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
					},
				},
			},
			routes = {}, -- Default routes
			status = {}, -- Status line components
			format = {}, -- Default formatters
			debug = false,
			commands = {},
			redirect = {
				view = "popup",
				filter = { event = "msg_show" },
			},
			log = { level = "info" }, -- Log level
			log_max_size = 1024, -- Maximum size for log files
		})

		-- Then explicitly set notify config
		require("notify").setup({
			merge_duplicates = false,
			stages = "fade_in_slide_out",
			timeout = 5000,
			background_colour = "#000000",
			minimum_width = 50,
			icons = {
				ERROR = "   ",
				WARN = "⚠️ ",
				INFO = "  ",
				DEBUG = "   ",
				TRACE = "󰴽 ",
			},
		})
	end,
}
