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
  --use ({ 'nanotee/sqls.nvim' })
  use 'nanotee/sqls.nvim'
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
	use("famiu/bufdelete.nvim")

  use { 'nosduco/remote-sshfs.nvim', config = get_config("remotessh"), requires = { {'nvim-telescope/telescope.nvim'} } }
  ---- Completion
  --use({
  --    "hrsh7th/nvim-cmp",
  --    requires = {
  --      "hrsh7th/cmp-nvim-lsp",
  --      "hrsh7th/cmp-buffer",
  --      "hrsh7th/cmp-path",
  --      "hrsh7th/cmp-cmdline",
  --      "f3fora/cmp-spell",
  --      "hrsh7th/cmp-calc",
  --      "hrsh7th/cmp-nvim-lsp-signature-help",
  --      --"lukas-reineke/cmp-rg",
  --      -- Not working:
  --      --      Error executing vim.schedule lua callback: Vim:E903: Process failed to start: no such file or directory: "-c"
  --      --stack traceback:
  --      --        [C]: in function 'jobstart'
  --      --        ...e/nvim/site/pack/packer/start/cmp-rg/lua/cmp-rg/init.lua:103: in function ''
  --      --        vim/_editor.lua: in function <vim/_editor.lua:0>
  --    },
  --    config = get_config("cmp"),
  --  })
  --  use({ "rafamadriz/friendly-snippets" })
  --  use({
  --    "L3MON4D3/LuaSnip",
  --    requires = "saadparwaiz1/cmp_luasnip",
  --    config = get_config("luasnip"),
  --  })
  -- Colorschemes

	if settings.theme == "tokyo" then
		use({ "folke/tokyonight.nvim", config = get_config("tokyo") })
	elseif settings.theme == "synthwave" then
		use({ 'maxmx03/fluoromachine.nvim', as = 'synthwave', config = get_config('synthwave') })
	elseif settings.theme == "rosepine" then
        use({ 'rose-pine/neovim', as = 'rose-pine', tag = 'v1.*', config = get_config("rosepine") })
	elseif settings.theme == "catppuccino" then
		use({ "catppuccin/nvim", as = "catppuccin", config = get_config("catppuccin") })
	elseif settings.theme == "dracula" then
		use({ "Mofiqul/dracula.nvim", as = "dracula", config = get_config("dracula") })
	else
		use({ "catppuccin/nvim", as = "catppuccin", config = get_config("catppuccin") })
	end
  -- Comment Boxes
  use({"LudoPinelli/comment-box.nvim"})
  -- Conflict Marker
	use({ "rhysd/conflict-marker.vim" })
  -- Easy Align
	use("junegunn/vim-easy-align") -- no lua alternative, https://github.com/Vonr/align.nvim not working for me
  -- Git Things
  use({
    "tpope/vim-fugitive",
    config = get_config("fugitive"),
  })
  use({
    "lewis6991/gitsigns.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = get_config("gitsigns"),
  })
  -- Grammarous
	use({ "rhysd/vim-grammarous", cmd = "GrammarousCheck" })
  -- Illuminate
	use({ "RRethy/vim-illuminate" })
  -- Terminal tools
  use { "junegunn/fzf" }
	use({ "voldikss/vim-floaterm"})
	use({ "voldikss/fzf-floaterm"})
  -- Lightspeed
	use({ "ggandor/lightspeed.nvim" })
--  use {"akinsho/toggleterm.nvim", tag = '*', config = function()
--    require("toggleterm").setup()
--  end}
--  use({ "lmburns/lf.nvim",
--          config = function()
--            -- This feature will not work if the plugin is lazy-loaded
--            vim.g.lf_netrw = 1
--            require("lf").setup(
--                {
--                    escape_quit = false,
--                    border = "rounded",
--                    --highlights = {FloatBorder = {guifg = require("kimbox.palette").colors.magenta}}
--                }
--            )
--  
--            vim.keymap.set("n", "<C-o>", ":Lf<CR>")
--          end,
--          requires = {"plenary.nvim", "toggleterm.nvim"}
--      }
--  )
  ---- LSP
  use ({
    'VonHeikemen/lsp-zero.nvim',
    config = get_config("lsp"),
    branch = 'v1.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {'williamboman/mason.nvim', config = get_config('formatting')},           -- Optional
      {'williamboman/mason-lspconfig.nvim'}, -- Optional
  
      -- Autocompletion
      {'hrsh7th/nvim-cmp'},         -- Required
      {'hrsh7th/cmp-nvim-lsp'},     -- Required
      {'hrsh7th/cmp-buffer'},       -- Optional
      {'hrsh7th/cmp-path'},         -- Optional
      {'saadparwaiz1/cmp_luasnip'}, -- Optional
      {'hrsh7th/cmp-nvim-lua'},     -- Optional
  
      -- Snippets
      {'L3MON4D3/LuaSnip', config = get_config("luasnip")},             -- Required
      {'rafamadriz/friendly-snippets'}, -- Optional

      -- Formatting
      {'mhartington/formatter.nvim', config = get_config('formatting') },
    }
  })
  --use({ "williamboman/mason.nvim", config = get_config("mason") })
  --use({ "Djancyp/cheat-sheet" })
  --use({ "neovim/nvim-lspconfig", config = get_config("lsp") })
  --use({ "onsails/lspkind-nvim", requires = { "famiu/bufdelete.nvim" } })
  -- LuaLine
  use ({
        'nvim-lualine/lualine.nvim',
        config = get_config("lualine"),
        event = "VimEnter",
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  })
  -- Notify
  use({ "rcarriga/nvim-notify", config = get_config("notify") })
  -- Specs
	--use({ "edluffy/specs.nvim", config = get_config("specs") })
  -- Startup Time
	use({ "tweekmonster/startuptime.vim" })
  -- Starlite
  use({ "ironhouzi/starlite-nvim"})
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
	use({ "ahmedkhalf/project.nvim", config = get_config("project") })
  -- Tmux Navigation
  use({ "aserowy/tmux.nvim", config = get_config("tmux") })
  -- Treesitter
  -- use({ "windwp/nvim-autopairs", config = get_config("nvim-autopairs") })
  use({
    "nvim-treesitter/nvim-treesitter",
    config = get_config("treesitter"),
    run = ":TSUpdate",
  })
  use("nvim-treesitter/nvim-treesitter-textobjects")
  use("RRethy/nvim-treesitter-endwise")
  -- To do
	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = get_config("todo"),
	})
  -- Tree
	--use({ "kyazdani42/nvim-tree.lua", config = get_config("nvim-tree")  })
  -- Twilight
	use({ "folke/twilight.nvim", config = get_config("twilight") })
	use({ "j-hui/fidget.nvim", config = function() require("fidget").setup({}) end, })
	--use({ "j-hui/fidget.nvim",   tag = 'legacy', config = function() require("fidget").setup({}) end, })
  -- Undo Tree
  use({ "mbbill/undotree" })
  -- Vimwiki
  use({ "vimwiki/vimwiki", config = get_config("vimwiki") })
  -- Which-Key
  use({ "folke/which-key.nvim", tag = 'v3.10.0', config = get_config("which-key") })
end)
