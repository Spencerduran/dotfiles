local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local TASKS_DIR = vim.fn.expand("~/vaults/mind_forge/04 - System/TaskNotes/Tasks")

local STATUS_ORDER = {
	["open"] = 1,
}

local function parse_frontmatter(filepath)
	local file = io.open(filepath, "r")
	if not file then
		return {}
	end
	local data = {}
	local in_fm = false
	local i = 0
	for line in file:lines() do
		i = i + 1
		if i == 1 and line == "---" then
			in_fm = true
		elseif in_fm and line == "---" then
			break
		elseif in_fm then
			local key, val = line:match("^([%w]+):%s*(.-)%s*$")
			if key then
				data[key] = val
			end
		end
	end
	file:close()
	return data
end

local STATUS_HL = {
	["open"] = "DiagnosticInfo",
}

local function make_display(entry)
	local status_col = string.format("%-12s", entry.status)
	local priority_col = string.format("%-12s", entry.priority:gsub("^%d%-", ""))
	local display_str = status_col .. " " .. priority_col .. " " .. entry.title

	local highlights = {}
	local hl = STATUS_HL[entry.status]
	if hl then
		table.insert(highlights, { { 0, #status_col }, hl })
	end
	-- title starts after status_col + space + priority_col + space
	local title_start = #status_col + 1 + #priority_col + 1
	table.insert(highlights, { { title_start, #display_str }, "TelescopeResultsIdentifier" })

	return display_str, highlights
end

local function tasks_picker(opts)
	opts = opts or {}
	local show_done = opts.show_done or false

	local files = vim.fn.globpath(TASKS_DIR, "*.md", false, true)
	local entries = {}

	for _, filepath in ipairs(files) do
		local fm = parse_frontmatter(filepath)
		local status = fm.status or "open"
		if (show_done or status ~= "done") and status ~= "on-hold" then
			table.insert(entries, {
				filepath = filepath,
				title = fm.title or vim.fn.fnamemodify(filepath, ":t:r"),
				status = status,
				priority = fm.priority or "normal",
				subjects = fm.subjects or "",
				scheduled = fm.scheduled or "",
			})
		end
	end

	table.sort(entries, function(a, b)
		local ao = STATUS_ORDER[a.status] or 9
		local bo = STATUS_ORDER[b.status] or 9
		if ao ~= bo then
			return ao < bo
		end
		return a.priority > b.priority
	end)

	pickers
		.new(opts, {
			prompt_title = show_done and "All Tasks" or "Active Tasks",
			finder = finders.new_table({
				results = entries,
				entry_maker = function(entry)
					return {
						value = entry,
						display = function()
							return make_display(entry)
						end,
						ordinal = entry.status .. " " .. entry.title,
						path = entry.filepath,
					}
				end,
			}),
			sorter = conf.generic_sorter(opts),
			previewer = conf.file_previewer(opts),
			attach_mappings = function(prompt_bufnr, _)
				actions.select_default:replace(function()
					actions.close(prompt_bufnr)
					local sel = action_state.get_selected_entry()
					vim.cmd("edit " .. vim.fn.fnameescape(sel.path))
				end)
				return true
			end,
		})
		:find()
end

return { picker = tasks_picker }
