-- CopyMatches and CopyLines functionality for Neovim
-- Converted from Vim script to Lua

local api = vim.api
local fn = vim.fn

-- Jump to first scratch window visible in current tab, or create it.
local function go_scratch()
  local windows = api.nvim_tabpage_list_wins(0)
  for _, win in ipairs(windows) do
    local buf = api.nvim_win_get_buf(win)
    if api.nvim_buf_get_option(buf, 'buftype') == 'nofile' then
      api.nvim_set_current_win(win)
      return
    end
  end
  api.nvim_command('new')
  api.nvim_buf_set_option(0, 'buftype', 'nofile')
  api.nvim_buf_set_option(0, 'bufhidden', 'hide')
  api.nvim_buf_set_option(0, 'swapfile', false)
end

-- Append match, with line number as prefix if wanted.
local function matcher(hits, match, linenums, subline)
  if match ~= '' then
    local prefix = linenums and string.format('%3d  ', subline) or ''
    table.insert(hits, prefix .. match)
  end
  return match
end

-- Append line numbers for lines in match to given list.
local function match_line_nums(numlist, match)
  local newlinecount = select(2, string.gsub(match, '[^\n]', ''))
  if match:sub(-1) == '\n' then
    newlinecount = newlinecount - 1
  end
  local current_line = fn.line('.')
  for i = current_line, current_line + newlinecount do
    table.insert(numlist, i)
  end
  return match
end

-- Return list of matches for given pattern in given range.
local function get_matches(line1, line2, pattern, wholelines, linenums)
  local lines = api.nvim_buf_get_lines(0, line1 - 1, line2, false)
  local temp_buf = api.nvim_create_buf(false, true)
  api.nvim_buf_set_lines(temp_buf, 0, -1, false, lines)

  local hits = {}
  local numlist = wholelines and {} or nil

  api.nvim_buf_call(temp_buf, function()
    if wholelines then
      fn.execute(string.format([[%d,%ds/%s/\=vim.fn.luaeval("match_line_nums(_A[1], _A[2])", {numlist, submatch(0)})/ge]], line1, line2, pattern))
    else
      fn.execute(string.format([[%d,%ds/%s/\=vim.fn.luaeval("matcher(_A[1], _A[2], _A[3], _A[4])", {hits, submatch(0), linenums, fn.line(".")})/ge]], line1, line2, pattern))
    end
  end)

  api.nvim_buf_delete(temp_buf, {force = true})

  if wholelines then
    local last = 0
    for _, lnum in ipairs(numlist) do
      if lnum > last then
        last = lnum
        local prefix = linenums and string.format('%3d  ', lnum) or ''
        table.insert(hits, prefix .. lines[lnum - line1 + 1])
      end
    end
  end

  return hits
end

-- Copy search matches to a register or a scratch buffer.
local function copy_matches(bang, line1, line2, args, wholelines)
  local reg, pattern = args:match('^([a-zA-Z"*+-]?)%s*(.*)')
  reg = reg ~= '' and reg or '+'
  pattern = pattern ~= '' and pattern or fn.getreg('/')

  local hits = get_matches(line1, line2, pattern, wholelines, bang == 1)
  local msg = 'No non-empty matches'

  if #hits > 0 then
    if reg == '-' then
      go_scratch()
      api.nvim_command("normal! G0m'")
      api.nvim_put(hits, 'l', true, true)
      api.nvim_command("''+1normal! zz")
    else
      fn.setreg(reg, table.concat(hits, '\n') .. '\n')
    end
    msg = 'Number of matches: ' .. #hits
  end

  print(msg)
end

-- Define Neovim commands
api.nvim_create_user_command('CopyMatches', function(opts)
  copy_matches(opts.bang and 1 or 0, opts.line1, opts.line2, opts.args, false)
end, {range = '%', nargs = '?', bang = true})

api.nvim_create_user_command('CopyLines', function(opts)
  copy_matches(opts.bang and 1 or 0, opts.line1, opts.line2, opts.args, true)
end, {range = '%', nargs = '?', bang = true})

-- Return the module
return {
  go_scratch = go_scratch,
  get_matches = get_matches,
  copy_matches = copy_matches
}
