-- ~/.config/nvim/lua/plugins/treesitter.lua
return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",  -- Use stable branch with old API
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },

    -- makes commands always available
    cmd = {
      "TSInstall", "TSUpdate", "TSUpdateSync", "TSUninstall",
      "TSInstallInfo", "TSModuleInfo",
      "TSBufEnable", "TSBufDisable", "TSEnable", "TSDisable",
    },

    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua", "vim", "vimdoc", "python", "javascript", "typescript", "tsx" },
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
}
