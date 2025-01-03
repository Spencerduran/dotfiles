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
	local done = false
	for i = 1, vim.fn.winnr("$") do
		vim.cmd(i .. "wincmd w")
		if vim.bo.buftype == "nofile" then
			done = true
			break
		end
	end
	if not done then
		vim.cmd("new")
		vim.bo.buftype = "nofile"
		vim.bo.bufhidden = "hide"
		vim.bo.swapfile = false
	end
end

--[[ Copy Matches Functions
Creates two commands for copying search matches or whole lines containing matches.

Usage:
/pattern     - First search for your pattern
:CopyMatches - Copy matches to clipboard
:CopyLines   - Copy whole lines containing matches to clipboard

Options:
:CopyMatches a  - Copy matches to register a
:CopyMatches -  - Show matches in scratch buffer
:CopyMatches!   - Include line numbers
:1,10CopyMatches - Only copy matches from lines 1-10

Examples:
/TODO        - Search for TODO
:CopyMatches - Copy all TODOs to clipboard
:CopyLines   - Copy all lines containing TODO
:CopyMatches! - Copy TODOs with line numbers
:CopyMatches - - Show TODOs in new scratch buffer
:CopyMatches a - Copy TODOs to register a
--]]
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
				-- For CopyMatches, add just the matches
				local line_matches = {}
				for match in line:gmatch(vim.fn.escape(pattern, "()[].+*?^$")) do
					if match ~= "" then
						if opts.bang then
							table.insert(line_matches, string.format("%3d  %s", opts.line1 + i - 1, match))
						else
							table.insert(line_matches, match)
						end
					end
				end
				vim.list_extend(matches, line_matches)
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
		vim.cmd("normal! G0m'")
		vim.api.nvim_put(matches, "l", true, true)
		vim.cmd("''+1normal! zz")
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
