local M = {}

-- Create scratch buffer
vim.cmd([[
function! GoScratch()
  ene
  setlocal buftype=nofile bufhidden=hide noswapfile
endfunction
]])

-- Word Processor mode
function M.Wp()
	vim.b.formatoptions = 1
	vim.b.expandtab = false
	vim.wo.wrap = true
	vim.wo.linebreak = true
	vim.wo.spell = true
	--set complete+=s
end

vim.api.nvim_create_user_command("CopySearch", function(args)
	vim.fn.setreg(args.reg, "")
	vim.api.nvim_cmd({
		cmd = "substitute",
		args = { string.format([[//\=setreg('%s', submatch(0), 'al')/n]], args.reg) },
		range = { args.line1, args.line2 },
	}, {})
end, { range = true, register = true })

local function go_scratch()
	vim.cmd("call GoScratch()")
end

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

return M
