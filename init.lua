require("options")

vim.call('plug#begin')

-- List your plugins here
vim.fn['plug#']('nvim-treesitter/nvim-treesitter') -- improved syntax highlighting, prerequisite for render-markdown
vim.fn['plug#']('MeanderingProgrammer/render-markdown.nvim')
vim.fn['plug#']('neovim/nvim-lspconfig')

vim.call('plug#end')

vim.lsp.enable('clangd')

require'nvim-treesitter.configs'.setup {
    ensure_installed = { "c", "lua", "markdown", "markdown_inline" },
    highlight = {
        enable = true,
    },
}
