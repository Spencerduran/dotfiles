local M = {}

--------------------------------------------------
-- Create scratch buffer
--------------------------------------------------
vim.cmd([[
function! GoScratch()
  ene
  setlocal buftype=nofile bufhidden=hide noswapfile
endfunction
]])
--------------------------------------------------
-- Word Processor mode
--------------------------------------------------
function M.Wp()
	vim.b.formatoptions = 1
	vim.b.expandtab = false
	vim.wo.wrap = true
	vim.wo.linebreak = true
	vim.wo.spell = true
	vim.keymap.set({ "n", "v" }, "j", "gj", { silent = true })
	vim.keymap.set({ "n", "v" }, "k", "gk", { silent = true })
end

--------------------------------------------------
--- Copy Matches
--------------------------------------------------
-- Creates two commands for copying search matches or whole lines containing matches.
-- Usage:
-- /pattern     - First search for your pattern
-- :CopyMatches - Copy matches to clipboard
-- :CopyLines   - Copy whole lines containing matches to clipboard
-- Options:
-- :CopyMatches a  - Copy matches to register a
-- :CopyMatches -  - Show matches in scratch buffer
-- :CopyMatches!   - Include line numbers
-- :1,10CopyMatches - Only copy matches from lines 1-10
--
-- Examples:
-- /TODO        - Search for TODO
-- :CopyMatches - Copy all TODOs to clipboard
-- :CopyLines   - Copy all lines containing TODO
-- :CopyMatches! - Copy TODOs with line numbers
-- :CopyMatches - - Show TODOs in new scratch buffer
-- :CopyMatches a - Copy TODOs to register a
--------------------------------------------------
local function copy_matches(opts, whole_lines)
	local pattern = vim.fn.getreg("/")
	local matches = {}

	-- Get current buffer content
	local lines = vim.api.nvim_buf_get_lines(0, opts.line1 - 1, opts.line2, false)

	-- Collect matches
	for i, line in ipairs(lines) do
		if vim.fn.match(line, pattern) >= 0 then
			if whole_lines then
				-- For CopyLines, add the whole line
				if opts.bang then
					table.insert(matches, string.format("%3d  %s", opts.line1 + i - 1, line))
				else
					table.insert(matches, line)
				end
			else
				-- For CopyMatches, use Vim's matchlist() to get all matches
				local start_pos = 0
				while true do
					local match_pos = vim.fn.match(line, pattern, start_pos)
					if match_pos == -1 then
						break
					end

					local match_end = vim.fn.matchend(line, pattern, start_pos)
					local match_str = line:sub(match_pos + 1, match_end)

					if match_str ~= "" then
						if opts.bang then
							table.insert(matches, string.format("%3d  %s", opts.line1 + i - 1, match_str))
						else
							table.insert(matches, match_str)
						end
					end

					start_pos = match_end
					if start_pos == -1 or start_pos >= #line then
						break
					end
				end
			end
		end
	end

	-- Handle output
	if #matches == 0 then
		print("No matches found")
		return
	end

	local reg = opts.args:match('^([a-zA-Z"*+-])')
	reg = reg or "+"

	if reg == "-" then
		-- Output to scratch buffer
		go_scratch()
		vim.api.nvim_put(matches, "l", false, true)
	else
		-- Copy to register
		vim.fn.setreg(reg, table.concat(matches, "\n") .. "\n")
	end

	print("Copied " .. #matches .. " matches")
end

-- Create the user commands
vim.api.nvim_create_user_command("CopyMatches", function(opts)
	copy_matches(opts, false)
end, {
	range = "%",
	bang = true,
	nargs = "?",
	desc = "Copy search matches to register or scratch buffer",
})

vim.api.nvim_create_user_command("CopyLines", function(opts)
	copy_matches(opts, true)
end, {
	range = "%",
	bang = true,
	nargs = "?",
	desc = "Copy lines containing matches to register or scratch buffer",
})

local function test_notifications()
	-- Basic notifications for each level
	vim.notify("This is an ERROR message", "ERROR")
	vim.defer_fn(function()
		vim.notify("This is a WARN message", "WARN")
	end, 1000)
	vim.defer_fn(function()
		vim.notify("This is an INFO message", "INFO")
	end, 2000)
	vim.defer_fn(function()
		vim.notify("This is a DEBUG message", "DEBUG")
	end, 3000)
	vim.defer_fn(function()
		vim.notify("This is a TRACE message", "TRACE")
	end, 4000)

	-- Test with different options
	vim.defer_fn(function()
		vim.notify("Custom timeout message", "INFO", {
			timeout = 2000,
			title = "Custom Title",
		})
	end, 5000)

	-- Test multi-line message
	vim.defer_fn(function()
		vim.notify(
			[[
            Multi-line notification
            with several
            lines of text
        ]],
			"INFO"
		)
	end, 6000)

	-- Test replace/update notification
	local notify = require("notify")
	vim.defer_fn(function()
		local notification = notify("Starting long process...", "INFO", {
			title = "Process Status",
			timeout = false, -- won't auto-dismiss
		})

		-- Update the notification after 2 seconds
		vim.defer_fn(function()
			notify("Process completed!", "SUCCESS", {
				replace = notification,
				title = "Process Status",
			})
		end, 2000)
	end, 7000)
end

-- Create a user command for easy testing
vim.api.nvim_create_user_command("TestNotify", test_notifications, {})
return M
