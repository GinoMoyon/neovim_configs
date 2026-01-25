-- ~/.config/nvim/lua/plugins/trouble.lua
-- Diagnostics panel (like VSCode Problems panel)

return {
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = { "Trouble", "TroubleToggle" },
    keys = {
      { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
      { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)" },
      { "<leader>xL", "<cmd>Trouble loclist toggle<cr>", desc = "Location List (Trouble)" },
      { "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List (Trouble)" },
    },

    config = function()
      require("trouble").setup({
        auto_close = false,
        auto_open = false,
        use_diagnostic_signs = true,  -- Use same signs as defined in LSP config
      })
    end,
  },
}
