--local nvim_lsp = require("lspconfig")
--
---- detect python venv
---- https://github.com/neovim/nvim-lspconfig/issues/500#issuecomment-851247107
--local util = require("lspconfig/util")
--local path = util.path
--local function get_python_path(workspace)
--	-- Use activated virtualenv.
--	if vim.env.VIRTUAL_ENV then
--		return path.join(vim.env.VIRTUAL_ENV, "bin", "python")
--	end
--	-- Find and use virtualenv in workspace directory.
--	for _, pattern in ipairs({ "*", ".*" }) do
--		local match = vim.fn.glob(path.join(workspace, pattern, "pyvenv.cfg"))
--		if match ~= "" then
--			return path.join(path.dirname(match), "bin", "python")
--		end
--	end
--	-- Fallback to system Python.
--	return vim.fn.exepath("python3") or vim.fn.exepath("python") or "python"
--end
--
--local capabilities = vim.lsp.protocol.make_client_capabilities()
--capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
--capabilities.textDocument.foldingRange = {
--	dynamicRegistration = false,
--	lineFoldingOnly = true,
--}
--
--local servers = {
--	"bashls",
--	"dockerls",
--	"jsonls",
--	"pyright",
--	"sumneko_lua",
--	"terraformls",
--	"texlab",
--	"yamlls",
--  "sqlls",
--}
---- Use a loop to conveniently call 'setup' on multiple servers
--for _, lsp in ipairs(servers) do
--	nvim_lsp[lsp].setup({
--		on_attach = function(client, bufnr)
--			require("functions").custom_lsp_attach(client, bufnr)
--		end,
--		before_init = function(_, config)
--			if lsp == "pyright" then
--				config.settings.python.pythonPath = get_python_path(config.root_dir)
--			end
--		end,
--		capabilities = capabilities,
--		settings = {
--			json = {
--				format = { enabled = false },
--				schemas = {
--					{
--						description = "Package config",
--						fileMatch = { "package.json" },
--						url = "https://json.schemastore.org/package",
--					},
--					{
--						description = "Packer config",
--						fileMatch = { "packer.json" },
--						url = "https://json.schemastore.org/packer",
--					},
--					{
--						description = "Renovate config",
--						fileMatch = {
--							"renovate.json",
--							"renovate.json5",
--							".github/renovate.json",
--							".github/renovate.json5",
--							".renovaterc",
--							".renovaterc.json",
--						},
--						url = "https://docs.renovatebot.com/renovate-schema",
--					},
--					{
--						description = "OpenApi config",
--						fileMatch = { "*api*.json" },
--						url = "https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json",
--					},
--				},
--			},
--      sql = {
--				filetypes = { "sql", "mysql" },
--      },
--			Lua = {
--				cmd = { "lua-language-server" },
--				filetypes = { "lua" },
--				runtime = {
--					version = "LuaJIT",
--				},
--				completion = { enable = true, callSnippet = "Both" },
--				diagnostics = {
--					enable = true,
--					globals = { "vim", "describe" },
--				},
--				workspace = {
--					library = {
--						vim.api.nvim_get_runtime_file("", true),
--					},
--					-- adjust these two values if your performance is not optimal
--					maxPreload = 2000,
--					preloadFileSize = 1000,
--				},
--				telemetry = { enable = false },
--			},
--			texlab = {
--				auxDirectory = ".",
--				bibtexFormatter = "texlab",
--				build = {
--					args = {
--						"--keep-intermediates",
--						"--keep-logs",
--						"--synctex",
--						"%f",
--					},
--					executable = "tectonic",
--					forwardSearchAfter = false,
--					onSave = false,
--				},
--				chktex = { onEdit = false, onOpenAndSave = false },
--				diagnosticsDelay = 300,
--				formatterLineLength = 80,
--				forwardSearch = { args = {} },
--				latexFormatter = "latexindent",
--				latexindent = { modifyLineBreaks = false },
--			},
--			yaml = {
--				schemaStore = {
--					enable = true,
--					url = "https://www.schemastore.org/api/json/catalog.json",
--				},
--				schemas = {
--					kubernetes = "*.yaml",
--					["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
--					["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
--					["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
--					["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
--					["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
--					["http://json.schemastore.org/ansible-playbook"] = "*play*.{yml,yaml}",
--					["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
--					["https://json.schemastore.org/dependabot-v2"] = ".github/dependabot.{yml,yaml}",
--					["https://json.schemastore.org/gitlab-ci"] = "*gitlab-ci*.{yml,yaml}",
--					["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"] = "*api*.{yml,yaml}",
--					["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "*docker-compose*.{yml,yaml}",
--					["https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json"] = "*flow*.{yml,yaml}",
--				},
--				format = { enabled = false },
--				completion = true,
--				hover = true,
--			},
--		},
--		flags = { debounce_text_changes = 150 },
--	})
--end


-- setup nvim-lspconfig
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', '<leader>k', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', 'ff', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require 'lspconfig'.pyright.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}
require 'lspconfig'.pylsp.setup {
    on_attach = on_attach,
    capabilities = capabilities
    , settings = {
        pylsp = {
            plugins = {
                flake8 = {
                    enabled = 1
                },
                pylint = {
                    enabled = true,
                    args = {
                        '--disable=C0114' -- disable missing module docstring info
                    }
                },
                yapf = {
                    enabled = true
                },
                autopep8 = {
                    enabled = false
                },
                pyflakes = {enabled = true},
                pyodestyle = {enabled = true},
                pydocstyle = {
                    enabled = false,
                    ignore = {
                        'D100', -- disable missing module docstring info
                        'D203', -- disable one line before class docstring required
                        'D213' -- disable multiline docstring summary
                        -- should start at the second line
                    }
                },
            }
        }
    }
}
--require 'lspconfig'.pyre.setup {
--on_attach = on_attach,
--capabilities = capabilities,
--}
require 'lspconfig'.bashls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}
require 'lspconfig'.dockerls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}
require 'lspconfig'.kotlin_language_server.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}
require 'lspconfig'.intelephense.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}
require 'lspconfig'.eslint.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}
require 'lspconfig'.tsserver.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}
require 'lspconfig'.perlnavigator.setup {
    settings = {
        perlnavigator = {
            perlPath = 'perl',
            enableWarnings = true,
            perltidyProfile = '',
            perlcriticProfile = '',
            perlcriticEnabled = true,
        }
    },
    on_attach = on_attach,
    capabilities = capabilities,
}

require 'lspconfig'.cssls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

require 'lspconfig'.cssmodules_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

require 'lspconfig'.diagnosticls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

require 'lspconfig'.jsonls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

require 'lspconfig'.sumneko_lua.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
            },
        },
    },
}
require 'lspconfig'.sqlls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    single_file_support = true,
		--root_dir = root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git")
}

require 'lspconfig'.yamlls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

require 'lspconfig'.lemminx.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

require 'lspconfig'.marksman.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}
