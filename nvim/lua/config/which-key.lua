require("which-key").setup({
      --debug = true -- enable wk.log in the current directjkujkui

      notify = false
})
local wk = require("which-key")
wk.add({
  { "<leader>b", group = "Buffers" },
      { "<leader>bb", "<cmd>Telescope buffers<cr>", desc = "Find buffer"},
      { "<leader>ba", "<cmd>BufferLineCloseLeft<cr><cmd>BufferLineCloseRight<cr>", desc = "Close all but the current buffer", },
      { "<leader>bd", "<cmd>Bdelete<CR>", desc = "Close buffer" },
      { "<leader>bf", "<cmd>BufferLinePick<cr>", desc = "Pick buffer" },
      { "<leader>bl", "<cmd>BufferLineCloseLeft<cr>", desc = "Close all buffers to the left" },
      { "<leader>bp", "<cmd>BufferLineCyclePrev<cr>", desc = "Move buffer prev" },
      { "<leader>bn", "<cmd>BufferLineCycleNext<cr>", desc = "Move buffer next" },
      { "<leader>bs", "<cmd>call GoScratch() <cr>", desc = "  Scratch buffer"},
      { "<leader>br", "<cmd>BufferLineCloseRight<cr>", desc = "Close all BufferLines to the right", },
      { "<leader>bx", "<cmd>BufferLineSortByDirectory<cr>", desc = "Sort BufferLines automatically by directory", },
      { "<leader>bL", "<cmd>BufferLineSortByExtension<cr>", desc = "Sort BufferLines automatically by extension", },

  { "<leader>c", group = "Copy" },
      { "<leader>cl" , "<cmd>CopyLines -<CR>", desc = "Copy lines with match" },
      { "<leader>cm" , "<cmd>CopyMatches -<CR>", desc = "Copy matches" },

  { "<leader>f", group = "Files" },
      { "<leader>fb" , "<cmd>:cd %:h|Telescope file_browser<cr>", desc = "File browser" },
      { "<leader>ff" , "<cmd>lua require'telescope.builtin'.find_files()<cr>", desc = "Find File", },
      { "<leader>fl" , "<cmd>Lf<cr>", desc = "Open LF" },
      { "<leader>ft" , "<cmd>NvimTreeToggle<cr>", desc = "Toggle Tree" },
      { "<leader>fr" , "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File" },
      { "<leader>fs" , "<cmd>w<cr>", desc = "Save Buffer" },
      { "<leader>fp" , "<cmd>Telescope projects<cr>", desc = "Projects" },

  { "<leader>g", group = "Git" },
      { "<leader>gb" , "<cmd>Telescope git_branches<cr>", desc = "Checkout branch" },
	  { "<leader>g3", "<cmd>Gvdiffsplit!<cr>", desc = "3 way diffsplit" },
      { "<leader>g3", "<cmd>Gvdiff<cr>", desc = "2 way diffsplit" },
      { "<leader>gg" , "<cmd>G<cr>", desc = "Git Status" },
      { "<leader>gl" , "<cmd>Telescope git_commits<cr>", desc = "Log" },
      { "<leader>gm" , "<cmd>Git merge develop<cr>", desc = "Git Pull" },
      { "<leader>gp" , "<cmd>Git push<cr>", desc = "Git Push" },
      { "<leader>gs" , "<cmd>Telescope git_status<cr>", desc = "See all changed files" },
      { "<leader>gu" , "<cmd>Git pull<cr>", desc = "Git Pull" },

  { "<leader>m", group = "Misc" },
	  { "<leader>mt", "<cmd>FloatermNew<cr>", desc = "New Floaterm" },
	  { "<leader>ml", ":s/^\\s*\\zs/\\=line('.') - line(\"'<\") + 1 . '. '<CR>", desc = "Numbered List", mode = "v" },

  { "<leader>q", group = "Quickfix" },
      { "<leader>qj" , "<cmd>cnext<cr>", desc = "Next Quickfix Item" },
      { "<leader>qk" , "<cmd>cprevious<cr>", desc = "Previous Quickfix Item" },
      { "<leader>qq" , "<cmd>lua require('functions').toggle_qf()<cr>", desc = "Toggle quickfix list" },
      { "<leader>qt" , "<cmd>TodoTelescope<cr>", desc = "Show TODOs" },

  { "<leader>r", group = "Ranger" },
      { "<leader>rr" , "<cmd>FloatermNew --disposable --opener=edit ranger<cr>", desc = "Ranger" },

  { "<leader>s", group = "Search" },
      { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Find Help" },
      { "<leader>sT", "<cmd>Telescope live_grep<cr>", desc = "Text" },
      { "<leader>st", "<cmd>Telescope live_grep<cr>", desc = "Text" },
      { "<leader>ss", "<cmd>Alpha<cr>", desc = "Alpha" },
      { "<leader>sS", "<cmd>Telescope symbols<cr>", desc = "Search symbols" },
      { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
      { "<leader>sc", "<cmd>Telescope commands<cr>", desc = "Commands" },
      { "<leader>sp", "<cmd>Telescope projects<cr>", desc = "Projects" },
      { "<leader>sP", "<cmd>Telescope builtin<cr>", desc = "Builtin pickers" },

  { "<leader>w", group = "Window" },
      {"<leader>wp", "<cmd>lua require('functions').Wp()<cr>", desc = "Word Processor Mode" },
      {"<leader>wq", "<cmd>:q<cr>", desc = "Close" },
      {"<leader>ws", "<cmd>:split<cr>", desc = "Horizontal Split" },
      {"<leader>wt", "<c-w>t", desc = "Move to new tab" },
      {"<leader>w=", "<c-w>=", desc = "Equally size" },
      {"<leader>wv", "<cmd>:vsplit<cr>", desc = "Verstical Split" },
      {"<leader>ww", "<cmd>:VimwikiIndex<cr>|cd /Users/spencer/repos/VimWiki/", desc = "Open Vimwiki Index"},

  { "<leader>x", group = "Spelling" },
      { "<leader>xn" , "]s", desc = "Next" },
      { "<leader>xp" , "[s", desc = "Previous" },
      { "<leader>xa" , "zg", desc = "Add word" },
      { "<leader>xf" , "1z=", desc = "Use 1. correction" },
      { "<leader>xl" , "<cmd>Telescope spell_suggest<cr>", desc = "List corrections" },
})

