vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.virtualedit = "block"
vim.opt.inccommand = "split" -- preview for :%s
vim.opt.ignorecase = true
vim.opt.splitright = true
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldnestmax = 4
vim.opt.colorcolumn = "100"
vim.opt.cinoptions = "(s,Ws,u2,U1,:s,l1"
vim.opt.grepprg = "rg --vimgrep"
vim.opt.grepformat = "%f:%l:%c:%m"
vim.o.shellslash = true -- Avoid 'No such file' and 'Can't open errorfile' when doing :grep on Windows
vim.o.shellxquote = '' -- Avoid 'Can't open errorfile' when doing :grep on Windows
-- note, :grep to go to pattern, :grep! to find it without going to it.

if string.find(os.getenv("SHELL") and os.getenv("SHELL") or "", "bash") then
  vim.opt.shellcmdflag = "-c" -- On windows this defaults to "/s /c" but that only works for cmd.exe.
end

vim.api.nvim_create_user_command('WQ', 'wq', {})
vim.api.nvim_create_user_command('Wq', 'wq', {})
vim.api.nvim_create_user_command('W', 'w', {})
vim.api.nvim_create_user_command('Qa', 'qa', {})
vim.api.nvim_create_user_command('Q', 'q', {})

vim.keymap.set("n", "<leader>w", function()
  local view = vim.fn.winsaveview()
  local search = vim.fn.getreg("/")
  vim.cmd([[%s/\s\+$//e]])
  vim.fn.setreg("/", search)
  vim.fn.winrestview(view)
end, { desc = "Trim trailing whitespace" })

-- Don't autocomment the next line
vim.cmd('autocmd BufEnter * set formatoptions-=cro')
vim.cmd('autocmd BufEnter * setlocal formatoptions-=cro')

-- Press Esc to get rid of the last search pattern.
vim.keymap.set('n', '<Esc>', function()
  vim.fn.setreg('/', '') -- clear search register
  vim.cmd('echo ""') -- clear the command line / error message
end, { silent = true, noremap = true })

vim.keymap.set("i", "<CR>", function()
  if vim.fn.search("{\\%#}", "n") ~= 0 then
    return "<CR><CR><Up><C-f>"
  else
    return "<CR>"
  end
end, { expr = true })

-- Enter insert mode on entering a terminal window.
vim.api.nvim_create_autocmd({"TermOpen", "BufEnter"}, {
  callback = function()
    if vim.opt.buftype:get() == "terminal" then
      vim.cmd(":startinsert")
    end
  end
})
-- Open a terminal window.
vim.keymap.set("n", "<leader>t", function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 7)
  vim.cmd(":startinsert")
end)

-- Set up diagnostics for LSP
vim.diagnostic.config({
  -- virtual_text = true,
  virtual_lines = true,
})

-- colours
vim.cmd("colorscheme vim")
vim.cmd('hi Pmenu guibg=#191e29')
vim.cmd('hi PmenuSel guibg=#2f394f')
vim.api.nvim_set_hl(0, "VirtColumn", { fg = "#00FF00" })

