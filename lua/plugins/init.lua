
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Core
  require("plugins.colorscheme"),  -- Load colorscheme first

  -- LSP & Completion
  require("plugins.lsp"),          -- Language servers (TypeScript, etc.)
  require("plugins.cmp"),          -- Auto-completion

  -- Formatting & Linting
  require("plugins.conform"),      -- Auto-formatting

  -- Git Integration
  require("plugins.gitsigns"),     -- Git signs in gutter
  require("plugins.lazygit"),      -- Git UI

  -- File Navigation
  require("plugins.telescope"),    -- Fuzzy finder
  require("plugins.neo-tree"),     -- File explorer

  -- Editing
  require("plugins.treesitter"),   -- Syntax highlighting
  require("plugins.treesitter_textobjects"),  -- Text objects
  require("plugins.mini_ai"),      -- Additional text objects
  require("plugins.autopairs"),    -- Auto-close brackets
  require("plugins.comment"),      -- Toggle comments

  -- UI
  require("plugins.lualine"),      -- Status line
  require("plugins.trouble"),      -- Diagnostics panel
  require("plugins.whichkey"),     -- Keybinding hints
}, {
  -- Lazy.nvim UI configuration
  ui = {
    border = "rounded",  -- Show borders: "none", "single", "double", "rounded", "solid", "shadow"
  },
})

