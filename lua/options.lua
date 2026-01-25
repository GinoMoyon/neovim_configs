-- ~/.config/nvim/init.lua

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = false  -- Absolute line numbers only

-- Sensible defaults
vim.opt.mouse = "a"
-- vim.opt.clipboard = "unnamedplus"  -- Disabled: we manage clipboard manually via keymaps
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.wrap = false

-- Tabs (adjust later)
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

-- Faster feedback
vim.opt.updatetime = 300
vim.opt.timeoutlen = 500

