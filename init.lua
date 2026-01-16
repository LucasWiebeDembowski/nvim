require("options")

vim.call('plug#begin')

vim.fn['plug#']('mason-org/mason.nvim') -- for installing LSPs
vim.fn['plug#']('nvim-treesitter/nvim-treesitter') -- prerequisite for render-markdown
vim.fn['plug#']('MeanderingProgrammer/render-markdown.nvim')
vim.fn['plug#']('neovim/nvim-lspconfig')
vim.fn['plug#']('numToStr/Comment.nvim')
vim.fn['plug#']('ibhagwan/fzf-lua')
vim.fn['plug#']('rafamadriz/friendly-snippets') -- optional: provides snippets for blink
vim.fn['plug#']('saghen/blink.cmp', {tag = 'v1.*'}) -- completions

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

local treesitter
if pcall(require, 'nvim-treesitter.configs') then
    treesitter = require("nvim-treesitter.configs")
else
    treesitter = require("nvim-treesitter.config")
end

treesitter.setup {
    ensure_installed = { "c", "lua", "markdown", "markdown_inline" },
    highlight = {
        enable = true,
    },
}

-- Note: require('<plugin>').setup(<table>) is equivalent to putting opts = <table> in a Lazy.nvim config.

require('Comment').setup ({
    toggler = { line = '<C-_>' }, -- vim interprets <C-/> as <C-_>
    opleader = { line = '<C-_>' }
})

require("fzf-lua").setup { defaults = { git_icons = false } }

vim.api.nvim_set_keymap("n", "<C-\\>", [[<Cmd>lua require"fzf-lua".buffers()<CR>]], {})
vim.api.nvim_set_keymap("n", "<C-k>", [[<Cmd>lua require"fzf-lua".builtin()<CR>]], {})
vim.api.nvim_set_keymap("n", "<C-p>", [[<Cmd>lua require"fzf-lua".files()<CR>]], {})
vim.api.nvim_set_keymap("n", "<C-l>", [[<Cmd>lua require"fzf-lua".live_grep()<CR>]], {})
vim.api.nvim_set_keymap("n", "<C-g>", [[<Cmd>lua require"fzf-lua".grep_project()<CR>]], {})
vim.api.nvim_set_keymap("n", "<F1>", [[<Cmd>lua require"fzf-lua".help_tags()<CR>]], {})

-- require("fzf-lua").utils.info("|<C-\\> buffers|<C-p> files|<C-g> grep|<C-l> live grep|<C-k> builtin|<F1> help|")

require("blink.cmp").setup({
    keymap = {
		preset = 'default',
		['<Up>'] = false,
		['<Down>'] = false,
	},
    appearance = {
        use_nvim_cmp_as_default = false,
        nerd_font_variant = 'mono',
    },
    sources = {default = { 'lsp', 'path', 'snippets', 'buffer' }},
    fuzzy = { implementation = "prefer_rust_with_warning" }
})
