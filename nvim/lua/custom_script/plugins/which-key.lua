return {
	"folke/which-key.nvim",
	version = "v3.10.0", -- Use a specific tag
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	opts = {
		notify = false,
	},
	config = function()
		local wk = require("which-key")
		wk.add({
			--------------------------------------------------
			{ "<leader>b", group = "Buffers" },
			--------------------------------------------------
			{ "<leader>bL", "<cmd>BufferLineSortByExtension<cr>", desc = "Sort BufferLines by extension" },
			{
				"<leader>ba",
				"<cmd>BufferLineCloseLeft<cr><cmd>BufferLineCloseRight<cr>",
				desc = "Close all but current buffer",
			},
			{ "<leader>bb", "<cmd>Telescope buffers<cr>", desc = "Find buffer" },
			{ "<leader>bd", "<cmd>Bdelete<CR>", desc = "Close buffer" },
			{ "<leader>bf", "<cmd>BufferLinePick<cr>", desc = "Pick buffer" },
			{ "<leader>bl", "<cmd>BufferLineCloseLeft<cr>", desc = "Close all buffers to the left" },
			{ "<leader>bn", "<cmd>BufferLineCycleNext<cr>", desc = "Move buffer next" },
			{ "<leader>bp", "<cmd>BufferLineCyclePrev<cr>", desc = "Move buffer prev" },
			{ "<leader>br", "<cmd>BufferLineCloseRight<cr>", desc = "Close all BufferLines to the right" },
			{ "<leader>bs", "<cmd>call GoScratch()<cr>", desc = "Scratch buffer" },
			{ "<leader>bx", "<cmd>BufferLineSortByDirectory<cr>", desc = "Sort BufferLines by directory" },

			--------------------------------------------------
			{ "<leader>c", group = "Copy" },
			--------------------------------------------------
			{ "<leader>cl", "<cmd>CopyLines<CR>", desc = "Copy lines with match" },
			{ "<leader>cm", "<cmd>CopyMatches<CR>", desc = "Copy matches" },

			--------------------------------------------------
			{ "<leader>f", group = "Files" },
			--------------------------------------------------
			{ "<leader>fb", "<cmd>:cd %:h|Telescope file_browser<cr>", desc = "File browser" },
			{ "<leader>ff", "<cmd>lua require'telescope.builtin'.find_files()<cr>", desc = "Find File" },
			{ "<leader>fl", "<cmd>Lf<cr>", desc = "Open LF" },
			{ "<leader>fp", "<cmd>Telescope projects<cr>", desc = "Projects" },
			{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File" },
			{ "<leader>fs", "<cmd>w<cr>", desc = "Save Buffer" },
			{ "<leader>ft", "<cmd>NvimTreeToggle<cr>", desc = "Toggle Tree" },

			--------------------------------------------------
			{ "<leader>g", group = "Git" },
			--------------------------------------------------
			{ "<leader>g3", "<cmd>Gvdiffsplit!<cr>", desc = "3 way diffsplit" },
			{ "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch" },
			{ "<leader>gl", "<cmd>Telescope git_commits<cr>", desc = "Log" },
			{ "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "See all changed files" },

			--------------------------------------------------
			{ "<leader>m", group = "Misc" },
			--------------------------------------------------
			{ "<leader>mt", "<cmd>FloatermNew<cr>", desc = "New Floaterm" },
			{
				"<leader>ml",
				":s/^\\s*\\zs/\\=line('.') - line(\"'<\") + 1 . '. '<CR>",
				desc = "Numbered List",
				mode = "v",
			},

			--------------------------------------------------
			{ "<leader>o", group = "Obsidian" },
			--------------------------------------------------
			--Follow Links
			{ "<leader>og", ":ObsidianFollowLink<cr>", desc = "Follow Link" },
			{ "<leader>ov", ":ObsidianFollowLink vsplit<cr>", desc = "Follow Link V-split" },

			--Open in Obsidian App
			{ "<leader>oo", ":ObsidianOpen<cr>", desc = "Open in Obsidian App" },

			--Daily Notes
			{ "<leader>ot", ":ObsidianToday<cr>", desc = "Today's Note" },
			--Create Links
			{ "<leader>ole", ":ObsidianLink<cr>", desc = "Link to existing", mode = { "n", "v" } },
			{ "<leader>oln", ":ObsidianLinkNew<cr>", desc = "Link To New Note", mode = { "n", "v" } },
			--New Notes
			{
				"<leader>one",
				":ObsidianExtractNote<cr>",
				desc = "New note by extracting selected text",
				mode = { "n", "v" },
			},
			{ "<leader>ont", ":ObsidianNewFromTemplate<cr>", desc = "New From Template" },

			--Switch / Search vault
			{ "<leader>off", ":ObsidianQuickSwitch<cr>", desc = "Quick Switch" },
			{ "<leader>ost", ":ObsidianSearch<cr>", desc = "RipGrep Vault" },

			--Quick Capture
			{ "<leader>ww", ":ObsidianNewFromTemplate<cr>", desc = "Open QuickCapture" },

			--Defined in keymaps.lua (C-SPACE)
			--{ "<leader>od", ":ObsidianToggleCheckbox<cr>", desc = "Toggle Checkbox" },
			--------------------------------------------------
			{ "<leader>q", group = "Quickfix" },
			--------------------------------------------------
			{ "<leader>qj", "<cmd>cnext<cr>", desc = "Next Quickfix Item" },
			{ "<leader>qk", "<cmd>cprevious<cr>", desc = "Previous Quickfix Item" },
			{ "<leader>qt", "<cmd>TodoTelescope<cr>", desc = "Show TODOs" },

			--------------------------------------------------
			{ "<leader>r", group = "Ranger" },
			--------------------------------------------------
			{ "<leader>rr", "<cmd>FloatermNew --disposable --opener=edit ranger<cr>", desc = "Ranger" },

			--------------------------------------------------
			{ "<leader>s", group = "Search" },
			--------------------------------------------------
			{ "<leader>sP", "<cmd>Telescope builtin<cr>", desc = "Builtin pickers" },
			{ "<leader>sS", "<cmd>Telescope symbols<cr>", desc = "Search symbols" },
			{ "<leader>sc", "<cmd>Telescope commands<cr>", desc = "Commands" },
			{ "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Find Help" },
			{ "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
			{ "<leader>sp", "<cmd>Telescope projects<cr>", desc = "Projects" },
			{ "<leader>ss", "<cmd>Alpha<cr>", desc = "Alpha" },
			{ "<leader>st", "<cmd>Telescope live_grep<cr>", desc = "Text" },

			--------------------------------------------------
			{ "<leader>t", group = "Text" },
			--------------------------------------------------
			--{ "<leader>tb", 'c**<c-r>"**<esc>', desc = "Bold text", mode = { "v" } },
			--{ "<leader>th", 'c==<c-r>"==<esc>', desc = "Highlight text", mode = { "v" } },
			--{ "<leader>tb", 's**<c-r>"**<esc>', desc = "Bold text", mode = { "v" } },
			--{ "<leader>th", 's==<c-r>"==<esc>', desc = "Highlight text", mode = { "v" } },
			{ "<leader>tb", ":s/\\%V\\(.*\\)\\%V/\\*\\*\\1\\*\\*/g<CR>", desc = "Bold text", mode = { "v" } },
			{ "<leader>th", ":s/\\%V\\(.*\\)\\%V/==\\1==/g<CR>", desc = "Highlight text", mode = { "v" } },

			--------------------------------------------------
			{ "<leader>w", group = "Window" },
			--------------------------------------------------
			{ "<leader>w=", "<c-w>=", desc = "Equally size" },
			{ "<leader>wp", "<cmd>lua require('custom_script.core.functions').Wp()<cr>", desc = "Word Processor Mode" },
			{ "<leader>wq", "<cmd>:q<cr>", desc = "Close" },
			{ "<leader>wt", "<c-w>t", desc = "Move to new tab" },
			{ "<leader>wv", "<cmd>:vsplit<cr>", desc = "Vertical Split" },

			--------------------------------------------------
			{ "<leader>x", group = "Spelling" },
			--------------------------------------------------
			{ "<leader>xa", "zg", desc = "Add word" },
			{ "<leader>xf", "1z=", desc = "Use 1. correction" },
			{ "<leader>xl", "<cmd>Telescope spell_suggest<cr>", desc = "List corrections" },
			{ "<leader>xn", "]s", desc = "Next" },
			{ "<leader>xp", "[s", desc = "Previous" },
		})
	end,
}
