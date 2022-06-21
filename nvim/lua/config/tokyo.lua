local tokyonight = require("tokyonight")
-- Load the colorscheme
vim.cmd[[colorscheme tokyonight]]
vim.g.tokyonight_style = "night"
vim.o.background = "dark"

-- Change the "hint" color to the "orange" color, and make the "error" color bright red
vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }

