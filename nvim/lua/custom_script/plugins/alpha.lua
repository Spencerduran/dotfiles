--return {
--	"goolord/alpha-nvim",
--	event = "VimEnter",
--	config = function()
--		local alpha = require("alpha")
--		local dashboard = require("alpha.themes.dashboard")
--
--		local header = require("custom_script.plugins.header_img.imgtest") -- Your header file
--		dashboard.section.header.val = header.header.val
--		dashboard.section.header.opts = header.header.opts
--		-- Global options
--		--_Gopts = {
--		--	position = "center",
--		--	hl = "Type",
--		--	wrap = "overflow",
--		--}
--
--		--local function load_random_header()
--		--	math.randomseed(os.time())
--		--	local header_folder = vim.fn.stdpath("config") .. "/lua/custom_script/plugins/header_img/"
--
--		--	-- Debug print
--		--	print("Looking for headers in: " .. header_folder)
--
--		--	-- Check if directory exists
--		--	if vim.fn.isdirectory(header_folder) == 0 then
--		--		print("Header folder not found at: " .. header_folder)
--		--		return nil
--		--	end
--
--		--	local files = vim.fn.globpath(header_folder, "*.lua", false, true)
--		--	-- Debug print
--		--	print("Found files: " .. vim.inspect(files))
--
--		--	if #files == 0 then
--		--		print("No .lua files found in header folder")
--		--		return nil
--		--	end
--
--		--	local random_file = files[math.random(#files)]
--		--	local module_name = random_file:match("([^/]+)%.lua$"):gsub("%.lua$", "")
--
--		--	-- Debug print
--		--	print("Attempting to load module: custom_script.plugins.header_img." .. module_name)
--
--		--	local success, header = pcall(require, "custom_script.plugins.header_img." .. module_name)
--
--		--	if not success then
--		--		print("Error loading header: " .. tostring(header))
--		--		return nil
--		--	end
--
--		--	return header.header
--		--end
--		-- Header change function
--		local function change_header()
--			local new_header = load_random_header()
--			if new_header then
--				dashboard.config.layout[2].val = new_header
--				vim.cmd("AlphaRedraw")
--			end
--		end
--
--		---- Initial header load
--		--local header = load_random_header()
--		--if header then
--		--	dashboard.section.header.val = header
--		--end
--
--		-- Buttons configuration
--		dashboard.section.buttons.val = {
--			dashboard.button("<C-d>", "󱓧  Open daily-notes", ":ObsidianToday<CR>"),
--			--dashboard.button("r", "󰄉  Recent files", ":Telescope oldfiles <CR>"),
--			--dashboard.button("u", "󱐥  Update plugins", "<cmd>Lazy update<CR>"),
--			--dashboard.button("c", "  Settings", ":e $HOME/.config/nvim/init.lua<CR>"),
--			--dashboard.button("p", "  Projects", ":e $HOME/Dev/Projects <CR>"),
--			--dashboard.button("d", "󱗼  Dotfiles", ":e $HOME/dotfiles <CR>"),
--			--dashboard.button("w", "  Change header image", change_header),
--			dashboard.button("s", "               scratch buffer", ":call GoScratch()<CR>"),
--			dashboard.button("e", "               new file", ":ene <CR>"),
--			dashboard.button("r", "               recent files", ":Telescope oldfiles <CR>"),
--			dashboard.button("f", "               find file", ":Telescope find_files <CR>"),
--			dashboard.button("F", "               ripgrep", ":Telescope live_grep <CR>"),
--			dashboard.button("p", "               search projects", ":Telescope projects<CR>"),
--			dashboard.button("b", "               file browser", ":Telescope file_browser <CR>"),
--			dashboard.button("u", "󰧇               update plugins", ":Lazy sync<CR>"), -- Changed from PackerSync
--			dashboard.button("c", "               configuration", ":e ~/.config/nvim/ <CR>"),
--			dashboard.button("q", "󰩈               quit", ":qa<CR>"),
--		}
--
--		-- Startup stats
--		vim.api.nvim_create_autocmd("User", {
--			pattern = "LazyVimStarted",
--			desc = "Add Alpha dashboard footer",
--			once = true,
--			callback = function()
--				local stats = require("lazy").stats()
--				local ms = math.floor(stats.startuptime * 100 + 0.5) / 100
--				dashboard.section.footer.val = {
--					" Loaded " .. stats.count .. " plugins  in " .. ms .. " ms ",
--				}
--				dashboard.section.footer.opts.hl = "DashboardFooter"
--				pcall(vim.cmd.AlphaRedraw)
--			end,
--		})
--
--		dashboard.opts.opts.noautocmd = true
--		alpha.setup(dashboard.opts)
--	end,
--}
----return {
----	"goolord/alpha-nvim",
----	dependencies = {
----
----		"nvim-tree/nvim-web-devicons", -- note: updated to new repository path
----	},
----	config = function()
----		local alpha = require("alpha")
----		local dashboard = require("alpha.themes.dashboard")
----
----		dashboard.section.header.val = {}
----
----		local buttons = {
----			type = "group",
----			val = {
----				{ type = "padding", val = 1 },
----				dashboard.button("s", "               scratch buffer", ":call GoScratch()<CR>"),
----				dashboard.button("e", "               new file", ":ene <CR>"),
----				dashboard.button("r", "               recent files", ":Telescope oldfiles <CR>"),
----				dashboard.button("f", "               find file", ":Telescope find_files <CR>"),
----				dashboard.button("F", "               ripgrep", ":Telescope live_grep <CR>"),
----				dashboard.button("p", "               search projects", ":Telescope projects<CR>"),
----				dashboard.button("b", "               file browser", ":Telescope file_browser <CR>"),
----				dashboard.button("u", "󰧇               update plugins", ":Lazy sync<CR>"), -- Changed from PackerSync
----				dashboard.button("c", "               configuration", ":e ~/.config/nvim/ <CR>"),
----				dashboard.button("q", "󰩈               quit", ":qa<CR>"),
----			},
----			position = "center",
----		}
----
----		dashboard.section.buttons.val = {
----			buttons,
----		}
----
----		alpha.setup(dashboard.opts)
----	end,
----}

return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		local header = require("custom_script.plugins.header_img.imgtest") -- Your header file
		dashboard.section.header.val = header.header.val
		dashboard.section.header.opts = header.header.opts

		local buttons = {
			type = "group",
			val = {
				{ type = "padding", val = 1 },
				dashboard.button("n", "󱓧               Open daily-notes", ":ObsidianToday<CR>"),
				dashboard.button("s", "               scratch buffer", ":call GoScratch()<CR>"),
				dashboard.button("e", "               new file", ":ene <CR>"),
				dashboard.button("r", "               recent files", ":Telescope oldfiles <CR>"),
				dashboard.button("f", "               find file", ":Telescope find_files <CR>"),
				dashboard.button("F", "               ripgrep", ":Telescope live_grep <CR>"),
				dashboard.button("p", "               search projects", ":Telescope projects<CR>"),
				dashboard.button("b", "               file browser", ":Telescope file_browser <CR>"),
				dashboard.button("u", "󰧇               update plugins", ":Lazy sync<CR>"), -- Changed from PackerSync
				dashboard.button("c", "               configuration", ":e ~/.config/nvim/ <CR>"),
				dashboard.button("q", "󰩈               quit", ":qa<CR>"),
			},
			position = "center",
		}

		dashboard.section.buttons.val = {
			buttons,
		}
		alpha.setup(dashboard.opts)
	end,
}
