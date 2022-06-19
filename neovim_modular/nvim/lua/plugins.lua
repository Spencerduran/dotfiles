local settings = require("user-conf")
local fn = vim.fn

-- initialize and configure packer
local packer = require("packer")

-- returns the require for use in `config` parameter of packer's use
-- expects the name of the config file
local function get_config(name)
	return string.format('require("config/%s")', name)
end

packer.init({
	enable = true, -- enable profiling via :PackerCompile profile=true
	threshold = 0, -- the amount in ms that a plugins load time must be over for it to be included in the profile
	max_jobs = 20, -- Limit the number of simultaneous jobs. nil means no limit. Set to 20 in order to prevent PackerSync form being "stuck" -> https://github.com/wbthomason/packer.nvim/issues/746
	-- Have packer use a popup window
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})


packer.startup(function(use)
  -- Packer self init
  use ({ 'wbthomason/packer.nvim' })
  -- Alpha-NVIM
	use({
		"goolord/alpha-nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
		config = get_config("alpha-nvim"),
	})
  -- Buffer Line
	use({
		"akinsho/nvim-bufferline.lua",
		requires = "kyazdani42/nvim-web-devicons",
		event = "BufReadPre",
		config = get_config("bufferline"),
	})
  -- Colorschemes
	if settings.theme == "nightfox" then
		use({ "EdenEast/nightfox.nvim", config = get_config("nightfox") })
	elseif settings.theme == "catppuccino" then
		use({ "catppuccin/nvim", as = "catppuccin", config = get_config("catppuccin") })
	elseif settings.theme == "moonlight" then
		use({ "shaunsingh/moonlight.nvim", config = get_config("moonlight") })
	else
		use({ "catppuccin/nvim", as = "catppuccin", config = get_config("catppuccin") })
	end
  -- Comment Boxes
  --use("LudoPinelli/comment-box.nvim")
  -- Defx
  use({ 'Shougo/defx.nvim' })
  use({ 'kristijanhusak/defx-git' })
  use({ 'kristijanhusak/defx-icons' })
  -- Lightspeed
	use({ "ggandor/lightspeed.nvim" })
  -- LuaLine
  use ({
        'nvim-lualine/lualine.nvim',
        config = get_config("lualine"),
        event = "VimEnter",
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  })
  -- Notify
  use({ "rcarriga/nvim-notify", config = get_config("notify") })

  -- Notify
	use({ "kyazdani42/nvim-tree.lua", config = get_config("nvim-tree") })

  -- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
		config = get_config("telescope"),
	})
	use({ "crispgm/telescope-heading.nvim" })
	use({ "nvim-telescope/telescope-symbols.nvim" })
	use({ "nvim-telescope/telescope-file-browser.nvim" })
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({ "nvim-telescope/telescope-packer.nvim" })
	use({ "nvim-telescope/telescope-ui-select.nvim" })
	use({ "nvim-telescope/telescope-project.nvim" })
  -- Tmux Navigation
  use({ "aserowy/tmux.nvim", config = get_config("tmux") })
  -- Which-Key
  use({ "folke/which-key.nvim", config = get_config("which-key") })
end)
