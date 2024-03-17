require("bufferline").setup{
    options = {
        separator_style = "slant",
        diagnostics = "nvim_lsp",
        hover = {
            enabled = true,
            delay = 200,
            reveal = {"close"}
        }
    }
}
