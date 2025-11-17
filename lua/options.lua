vim.opt['tabstop'] = 4

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

