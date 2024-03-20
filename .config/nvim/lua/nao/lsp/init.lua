local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
    return
end

require("mason").setup {}
require("mason-lspconfig").setup {}
lspconfig.lua_ls.setup {
    settings = {
        Lua = {
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
            },
        },
    },
}
lspconfig.pyright.setup {}
lspconfig.tsserver.setup {}
lspconfig.rust_analyzer.setup {
    -- Server-specific settings. See `:help lspconfig-setup`
    settings = {
        ['rust-analyzer'] = {},
    },
}

lspconfig.clangd.setup {}
lspconfig.cssls.setup {}
lspconfig.html.setup {
    filetypes = {
        "html.mustache",
        "mustache",
    }
}

require("nao.lsp.handlers")
