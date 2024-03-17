local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("nvim-lsp-installer").setup {}
require'lspconfig'.pyright.setup{}
require'lspconfig'.tsserver.setup{}
require'lspconfig'.rust_analyzer.setup{}
require("nao.lsp.handlers")
