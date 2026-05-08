return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_tool_installer = require("mason-tool-installer")

    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    -- mason-lspconfig auto-enables all installed servers via vim.lsp.enable()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "html",
        "cssls",
        "tailwindcss",
        "svelte",
        "lua_ls",
        "pyright",
        "sqlls",
      },
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "prettier", -- prettier formatter
        "stylua", -- lua formatter
        "isort", -- python formatter
        "black", -- python formatter
        "pylint",
        "eslint_d",
        "sqlfmt",
        "sql-formatter",
      },
    })
  end,
}
