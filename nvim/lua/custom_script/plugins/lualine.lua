return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      options = {
        theme = 'tokyonight'
      },
      sections = {
        lualine_a = { { "branch", icon = "  "} },
        lualine_b = {
          {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            sections = { "error", "warn", "info", "hint" },
            symbols = {
              error = "❗ ",
              warn = " 🚨 ",
              info = " 🔍 ",
              hint = " 💡 "
            },
          },
        },
        lualine_c = {
          {
            "filetype",
            icon_only = true,
          },
          {
            "filename",
            file_status = true,
            path = 1,
            shorting_target = 40,
            symbols = { 
              modified = " ⭐ ",
              readonly = " 🔒 ",
              unnamed = " 📝 ",
            },
          },
          { "diff",
            symbols = {
              added = "  ",
              modified = " ",
              removed = "  "
            },
          }
        },
        lualine_x = {
          "encoding",
          "fileformat",
          "filesize",
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
    })
  end,
}
