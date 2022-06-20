require("project_nvim").setup({
	detection_methods = { "lsp", "pattern" },
	--detection_methods = { ".git" },
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
function _ADD_CURR_DIR_TO_PROJECTS()
  local historyfile = require("project_nvim.utils.path").historyfile
  local curr_directory = vim.fn.expand("%:p:h")
  vim.cmd("!echo " .. curr_directory .. " >> " .. historyfile)
end

vim.cmd("command! ProjectAddManually lua _ADD_CURR_DIR_TO_PROJECTS()")

