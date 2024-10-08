local telescope = require("telescope")
local actions = require("telescope.actions")
local action_layout = require("telescope.actions.layout")
local fb_actions = require("telescope").extensions.file_browser.actions
require('telescope').load_extension 'remote-sshfs'
telescope.setup({
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			case_mode = "smart_case", -- or "ignore_case" or "respect_case" or "smart_case"
		},
--		["ui-select"] = {
--			require("telescope.themes").get_dropdown({}),
--		},
		file_browser = {
			mappings = {
				i = {
					["<c-n>"] = fb_actions.create,
					["<c-r>"] = fb_actions.rename,
					["<c-w>"] = actions.which_key,
					["<c-h>"] = fb_actions.toggle_hidden,
					["<c-x>"] = fb_actions.remove,
					["<c-p>"] = fb_actions.move,
					["<c-y>"] = fb_actions.copy,
					["<c-a>"] = fb_actions.select_all,
				},
			},
		},
	},
	pickers = {
		find_files = {
			hidden = true,
		},
		buffers = {
			ignore_current_buffer = false,
			sort_lastused = true,
		},
		-- find_command = { "fd", "--hidden", "--type", "file", "--follow", "--strip-cwd-prefix" },
	},
	defaults = {
    --file_ignore_patterns = {"!{.pyenv,.local,.idea,.vscode,tmp,~/Library,/Users/sduran/Library,.vim,.git,node_modules,vendor}/*"},
		--file_ignore_patterns = {"~/.pyenv/*", "~/Applications/*", "~/Library/*", "~/.vscode", "node_modules", "%.jpg", "%.png", "~/.vim" },
		-- used for grep_string and live_grep
		vimgrep_arguments = {
			"rg",
			"--follow",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--no-ignore",
			"--trim",
		},
		mappings = {
			i = {
				-- Close on first esc instead of going to normal mode
				-- https://github.com/nvim-telescope/telescope.nvim/blob/master/lua/telescope/mappings.lua
				["<esc>"] = actions.close,
				["<C-j>"] = actions.move_selection_next,
				["<PageUp>"] = actions.results_scrolling_up,
				["<PageDown>"] = actions.results_scrolling_down,
				["<C-u>"] = actions.preview_scrolling_up,
				["<C-d>"] = actions.preview_scrolling_down,
				["<C-k>"] = actions.move_selection_previous,
				["<C-q>"] = actions.send_selected_to_qflist,
				["<C-l>"] = actions.send_to_qflist,
				["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
				["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
				["<cr>"] = actions.select_default,
				["<c-v>"] = actions.select_vertical,
				["<c-s>"] = actions.select_horizontal,
				["<c-t>"] = actions.select_tab,
				["<c-p>"] = action_layout.toggle_preview,
				["<c-o>"] = action_layout.toggle_mirror,
				["<c-h>"] = actions.which_key,
			},
		},
		--prompt_prefix = "> ",
		--selection_caret = " ",
		--entry_prefix = "  ",
		--multi_icon = "<>",
		--initial_mode = "insert",
		--scroll_strategy = "cycle",
		--selection_strategy = "reset",
		--sorting_strategy = "descending",
		--layout_strategy = "horizontal",
		--layout_config = {
		--	width = 0.95,
		--	height = 0.85,
		--	-- preview_cutoff = 120,
			--prompt_position = "top",
		--	horizontal = {
		--		preview_width = function(_, cols, _)
		--			if cols > 200 then
		--				return math.floor(cols * 0.4)
		--			else
		--				return math.floor(cols * 0.6)
		--			end
		--		end,
		--	},
		--	vertical = { width = 0.9, height = 0.95, preview_height = 0.5 },
		--	flex = { horizontal = { preview_width = 0.9 } },
		--},
		--winblend = 0,
		--border = {},
		--borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		--color_devicons = true,
		--use_less = true,
		--set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
	},
})

telescope.load_extension("projects")
telescope.load_extension("fzf")
telescope.load_extension("heading")
telescope.load_extension("file_browser")
telescope.load_extension("packer")
telescope.load_extension("ui-select")
