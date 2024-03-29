---- Utilities for creating configurations
--local util = require "formatter.util"
--
---- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
--require("formatter").setup {
--  -- Enable or disable logging
--  logging = true,
--  -- Set the log level
--  log_level = vim.log.levels.WARN,
--  -- All formatter configurations are opt-in
--  filetype = {
--    -- Formatter configurations for filetype "python" go here
--    -- and will be executed in order
--    python = {
--      require("formatter.filetypes.python").autopep8,
--    },
--    python = {
--      require("formatter.filetypes.python").autopep8,
--    },
--    -- Formatter configurations for filetype "lua" go here
--    -- and will be executed in order
--    ["*"] = {
--      -- "formatter.filetypes.any" defines default configurations for any
--      -- filetype
--      require("formatter.filetypes.any").remove_trailing_whitespace
--    }
--  }
--}
-- Utilities for creating configurations
local util = require "formatter.util"

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup {
  -- Enable or disable logging
  logging = true,
  -- Set the log level
  log_level = vim.log.levels.WARN,
  -- All formatter configurations are opt-in
  filetype = {
    -- Formatter configurations for filetype "python" go here
    -- and will be executed in order
    python = {
      require("formatter.filetypes.python").autopep8,
    },
    -- Formatter configurations for filetype "lua" go here
    -- and will be executed in order
    ["*"] = {
      -- "formatter.filetypes.any" defines default configurations for any
      -- filetype
      require("formatter.filetypes.any").remove_trailing_whitespace
    },
    -- Formatter configurations for filetype "sql" go here
    sql = {
      function()
        return {
          exe = "sql-formatter", 
          --args = {"--reindent", "--keyword-case", "upper"},
          stdin = true
        }
      end
    },
  }
}
