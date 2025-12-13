require("options")

vim.call('plug#begin')

-- List your plugins here
vim.fn['plug#']('nvim-treesitter/nvim-treesitter') -- syntax tree for things like highlighting, prerequisite for render-markdown
vim.fn['plug#']('MeanderingProgrammer/render-markdown.nvim')
vim.fn['plug#']('neovim/nvim-lspconfig')
vim.fn['plug#']('numToStr/Comment.nvim')

vim.call('plug#end')

require('Comment').setup ({
	toggler = { line = '<C-_>' }, -- vim interprets <C-/> as <C-_>
	opleader = { line = '<C-_>' }
})

vim.lsp.enable('clangd')

require'nvim-treesitter.configs'.setup {
    ensure_installed = { "c", "lua", "markdown", "markdown_inline" },
    highlight = {
        enable = true,
    },
}
