vim.call('plug#begin')

-- List your plugins here
vim.fn['plug#']('nvim-treesitter/nvim-treesitter') -- improved syntax highlighting, prerequisite for render-markdown
vim.fn['plug#']('MeanderingProgrammer/render-markdown.nvim')

vim.call('plug#end')

require("options")
