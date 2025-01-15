return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- Function to load a random header
		local function load_random_header()
			-- Get the header folder path
			local header_folder = vim.fn.stdpath("config") .. "/lua/custom_script/plugins/header_img/"

			-- Check if directory exists
			if vim.fn.isdirectory(header_folder) == 0 then
				print("Header folder doesn't exist: " .. header_folder)
				return nil
			end

			-- Get all .lua files in the folder
			local files = vim.fn.globpath(header_folder, "*.lua", false, true)
			if #files == 0 then
				print("No header files found in: " .. header_folder)
				return nil
			end

			-- Set random seed
			math.randomseed(os.time())

			-- Select random file
			local random_file = files[math.random(#files)]

			-- Extract module name from file path
			local module_name = random_file:match("([^/]+)%.lua$"):gsub("%.lua$", "")

			-- Try to load the header
			local ok, header = pcall(require, "custom_script.plugins.header_img." .. module_name)
			if not ok then
				print("Failed to load header: " .. module_name)
				return nil
			end

			return header.header
		end

		-- Function to change header
		local function change_header()
			local new_header = load_random_header()
			if new_header then
				dashboard.section.header.val = new_header.val
				dashboard.section.header.opts = new_header.opts
				vim.cmd("AlphaRedraw")
			end
		end

		-- Initial header load
		local header = load_random_header()
		if header then
			dashboard.section.header.val = header.val
			dashboard.section.header.opts = header.opts
		end

		local buttons = {
			type = "group",
			val = {
				{ type = "padding", val = 1 },
				dashboard.button("s", "               scratch buffer", ":call GoScratch()<CR>"),
				dashboard.button("r", "               recent files", ":Telescope oldfiles <CR>"),
				dashboard.button("e", "               new file", ":ene <CR>"),
				dashboard.button("p", "               search projects", ":Telescope projects<CR>"),
				dashboard.button("b", "               file browser", ":Telescope file_browser <CR>"),
				dashboard.button("n", "󱓧               Open daily-notes", ":ObsidianToday<CR>"),
				dashboard.button("f", "               find file", ":Telescope find_files <CR>"),
				dashboard.button("F", "               ripgrep", ":Telescope live_grep <CR>"),
				dashboard.button("c", "               configuration", ":e ~/.config/nvim/ <CR>"),
				--dashboard.button("h", "                change header", change_header), -- Added header change button
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
--
--		local buttons = {
--			type = "group",
--			val = {
--				{ type = "padding", val = 1 },
--				dashboard.button("n", "󱓧               Open daily-notes", ":ObsidianToday<CR>"),
--				dashboard.button("s", "               scratch buffer", ":call GoScratch()<CR>"),
--				dashboard.button("e", "               new file", ":ene <CR>"),
--				dashboard.button("r", "               recent files", ":Telescope oldfiles <CR>"),
--				dashboard.button("f", "               find file", ":Telescope find_files <CR>"),
--				dashboard.button("F", "               ripgrep", ":Telescope live_grep <CR>"),
--				dashboard.button("p", "               search projects", ":Telescope projects<CR>"),
--				dashboard.button("b", "               file browser", ":Telescope file_browser <CR>"),
--				dashboard.button("u", "󰧇               update plugins", ":Lazy sync<CR>"), -- Changed from PackerSync
--				dashboard.button("c", "               configuration", ":e ~/.config/nvim/ <CR>"),
--				dashboard.button("q", "󰩈               quit", ":qa<CR>"),
--			},
--			position = "center",
--		}
--
--		dashboard.section.buttons.val = {
--			buttons,
--		}
--		alpha.setup(dashboard.opts)
--	end,
--}
