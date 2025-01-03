return {
	{
		"ahmedkhalf/project.nvim",
		config = function()
			require("project_nvim").setup({
				detection_methods = { "lsp", "pattern" },
				manual_mode = false,
				silent_chdir = true,
				show_hidden = true,
				patterns = {
					".git",
					"package.json",
					"requirements.yml",
					"pyrightconfig.json",
					"pyproject.toml",
				},
			})

			-- Add command to manually add current directory to projects
			local function add_curr_dir_to_projects()
				local historyfile = require("project_nvim.utils.path").historyfile
				local curr_directory = vim.fn.expand("%:p:h")
				vim.cmd("!echo " .. curr_directory .. " >> " .. historyfile)
			end

			vim.api.nvim_create_user_command("ProjectAddManually", add_curr_dir_to_projects, {})
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/popup.nvim",
			"nvim-lua/plenary.nvim",
			"crispgm/telescope-heading.nvim",
			"nvim-telescope/telescope-symbols.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
			"folke/todo-comments.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-telescope/telescope-ui-select.nvim",
			"ahmedkhalf/project.nvim",
		},
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			local action_layout = require("telescope.actions.layout")
			local fb_actions = require("telescope").extensions.file_browser.actions

			telescope.setup({
				extensions = {
					fzf = {
						fuzzy = true,
						case_mode = "smart_case",
					},
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
				},
				defaults = {
					path_display = { "smart" },
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
				},
			})

			-- Load extensions
			telescope.load_extension("projects")
			telescope.load_extension("fzf")
			telescope.load_extension("heading")
			telescope.load_extension("file_browser")
			telescope.load_extension("ui-select")
		end,
	},
}
