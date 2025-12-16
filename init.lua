require("options")

vim.call('plug#begin')

vim.fn['plug#']('mason-org/mason.nvim') -- for installing LSPs
vim.fn['plug#']('nvim-treesitter/nvim-treesitter') -- prerequisite for render-markdown
vim.fn['plug#']('MeanderingProgrammer/render-markdown.nvim')
vim.fn['plug#']('neovim/nvim-lspconfig')
vim.fn['plug#']('numToStr/Comment.nvim')

vim.call('plug#end')

require("mason").setup()

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      diagnostics = { globals = { "vim" } },
      workspace = {
        library = vim.env.VIMRUNTIME,
        checkThirdParty = false,
      },
      telemetry = { enable = false },
    },
  },
})

vim.lsp.enable('clangd')
vim.lsp.enable('lua_ls')

require'nvim-treesitter.configs'.setup {
    ensure_installed = { "c", "lua", "markdown", "markdown_inline" },
    highlight = {
        enable = true,
    },
}

require('Comment').setup ({
	toggler = { line = '<C-_>' }, -- vim interprets <C-/> as <C-_>
	opleader = { line = '<C-_>' }
})

