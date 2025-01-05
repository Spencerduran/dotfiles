return {
	"gen740/SmoothCursor.nvim",
	config = function()
		require("smoothcursor").setup({
			always_redraw = true, -- Redraw the screen on each update
			autostart = true,
			cursor = "", -- cursor shape (need nerd font)
			disable_float_win = false, -- disable on float window
			disabled_filetypes = nil, -- this option will be skipped if enabled_filetypes is set. example: { "TelescopePrompt", "NvimTree" }
			enabled_filetypes = nil, -- example: { "lua", "py" }
			intervals = 35, -- tick interval
			linehl = nil, -- highlight sub-cursor line like 'cursorline', "CursorLine" recommended
			max_threshold = 999,
			priority = 10, -- set marker priority
			speed = 25, -- max is 100 to stick to your current position
			texthl = "SmoothCursor", -- highlight group, default is { bg = nil, fg = "#FFD400" }
			threshold = 3, -- animate if threshold lines jump
			timeout = 3000, -- timout for animation
			type = "matrix", -- define cursor movement calculate function, "default" or "exp" (exponential)
			matrix = { -- Loaded when 'type' is set to "matrix"
				enable = true,
				head = {
					-- Picks a random character from this list for the cursor text
					cursor = require("smoothcursor.matrix_chars"),
					-- Picks a random highlight from this list for the cursor text
					texthl = {
						"SmoothCursor",
					},
					linehl = nil, -- No line highlight for the head
				},
				body = {
					length = 6, -- Specifies the length of the cursor body
					-- Picks a random character from this list for the cursor body text
					cursor = require("smoothcursor.matrix_chars"),
					-- Picks a random highlight from this list for each segment of the cursor body
					texthl = {
						"SmoothCursorGreen",
					},
				},
				tail = {
					-- Picks a random character from this list for the cursor tail (if any)
					cursor = nil,
					-- Picks a random highlight from this list for the cursor tail
					texthl = {
						"SmoothCursor",
					},
				},
				unstop = false, -- Determines if the cursor should stop or not (false means it will stop)
			},
			fancy = {
				enable = false, -- enable fancy mode
				head = { cursor = "▷", texthl = "SmoothCursor", linehl = nil },
				body = {
					{ cursor = "", texthl = "SmoothCursorRed" },
					{ cursor = "", texthl = "SmoothCursorOrange" },
					{ cursor = "●", texthl = "SmoothCursorYellow" },
					{ cursor = "●", texthl = "SmoothCursorGreen" },
					{ cursor = "•", texthl = "SmoothCursorAqua" },
					{ cursor = ".", texthl = "SmoothCursorBlue" },
					{ cursor = ".", texthl = "SmoothCursorPurple" },
				},
				tail = { cursor = nil, texthl = "SmoothCursor" }, -- false to disable fancy tail
			},
		})
	end,
	event = { "BufRead", "BufNewFile" },
}
