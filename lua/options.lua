vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
-- vim.opt.expandtab = true
vim.opt.number = true
vim.opt.virtualedit = "block"
vim.opt.inccommand = "split" -- preview for :%s
vim.opt.ignorecase = true
vim.opt.splitright = true

vim.api.nvim_create_user_command('WQ', 'wq', {})
vim.api.nvim_create_user_command('Wq', 'wq', {})
vim.api.nvim_create_user_command('W', 'w', {})
vim.api.nvim_create_user_command('Qa', 'qa', {})
vim.api.nvim_create_user_command('Q', 'q', {})

-- Don't autocomment the next line
vim.cmd('autocmd BufEnter * set formatoptions-=cro')
vim.cmd('autocmd BufEnter * setlocal formatoptions-=cro')

-- Press Esc to get rid of the last search pattern.
vim.keymap.set('n', '<Esc>', ':let @/=""<CR>', {silent=true, noremap=true})

-- Set up diagnostics
vim.diagnostic.config({
	-- virtual_text = true,
	virtual_lines = true,
})

-- Define your colorscheme preferences
local filetype_colors = {
  markdown = "default",
  lua = "vim",
}

local default_colorscheme = "vim"

-- Apply colorscheme safely
local function apply_colorscheme(name)
  local ok, err = pcall(vim.cmd.colorscheme, name)
  if not ok then
    vim.notify("Colorscheme '" .. name .. "' failed: " .. err, vim.log.levels.WARN)
  end
end

-- Autocmd that switches colorscheme whenever you enter a buffer
vim.api.nvim_create_augroup("DynamicColorscheme", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter" }, {
  group = "DynamicColorscheme",
  callback = function()
    local ft = vim.bo.filetype
    local colors = filetype_colors[ft] or default_colorscheme
    apply_colorscheme(colors)
  end,
})
