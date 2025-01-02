require('mason').setup({
    ensure_installed = { 'sqls' }
})

require('lspconfig').sqls.setup{}
