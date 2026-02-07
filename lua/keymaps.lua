-- ~/.config/nvim/lua/keymaps.lua
-- Global keymaps (no plugins)

-- Leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Example: exit insert mode quickly (optional, remove if you want)
-- vim.keymap.set("i", "jk", "<Esc>")

-- Clipboard behavior:
-- y  - yank to vim unnamed register only (not system clipboard)
-- d  - delete to vim unnamed register only (not system clipboard)
-- p  - paste from vim unnamed register
-- <leader>y - yank to system clipboard
-- <leader>p - paste from system clipboard

-- Delete operations go to unnamed register (not system clipboard)
vim.keymap.set({ "n", "x" }, "d", '""d', { desc = "Delete to unnamed register" })
vim.keymap.set({ "n", "x" }, "D", '""D', { desc = "Delete to end (unnamed register)" })
vim.keymap.set({ "n", "x" }, "c", '""c', { desc = "Change (unnamed register)" })
vim.keymap.set({ "n", "x" }, "C", '""C', { desc = "Change to end (unnamed register)" })
vim.keymap.set("n", "x", '""x', { desc = "Delete char (unnamed register)" })
vim.keymap.set("n", "X", '""X', { desc = "Delete char backward (unnamed register)" })

-- Explicit system clipboard operations
vim.keymap.set({ "n", "x" }, "<leader>d", '"+d', { desc = "Delete to system clipboard" })
vim.keymap.set({ "n", "x" }, "<leader>y", '"+y', { desc = "Yank to system clipboard" })
vim.keymap.set({ "n", "x" }, "<leader>p", '"+p', { desc = "Paste from system clipboard" })
vim.keymap.set({ "n", "x" }, "<leader>P", '"+P', { desc = "Paste before from system clipboard" })

-- Folding (functions/classes fold based on indentation)
vim.keymap.set("n", "za", "za", { desc = "Toggle fold under cursor" })
vim.keymap.set("n", "zc", "zc", { desc = "Close fold under cursor" })
vim.keymap.set("n", "zo", "zo", { desc = "Open fold under cursor" })
vim.keymap.set("n", "zM", "zM", { desc = "Close all folds" })
vim.keymap.set("n", "zR", "zR", { desc = "Open all folds" })

