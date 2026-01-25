-- ~/.config/nvim/lua/plugins/conform.lua
-- Auto-formatting on save with Prettier, etc.

return {
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },  -- Load on file open, not just on save
    cmd = { "ConformInfo" },

    config = function()
      require("conform").setup({
        -- Formatters by filetype
        formatters_by_ft = {
          javascript = { "prettier" },
          typescript = { "prettier" },
          javascriptreact = { "prettier" },
          typescriptreact = { "prettier" },
          css = { "prettier" },
          html = { "prettier" },
          json = { "prettier" },
          yaml = { "prettier" },
          markdown = { "prettier" },
          lua = { "stylua" },
          python = { "black" },
        },

        -- Format on save
        format_on_save = {
          timeout_ms = 1000,  -- Increased from 500ms for larger files
          lsp_fallback = true,  -- Use LSP formatter if conform formatter not available
        },

        -- Customize formatters (optional)
        formatters = {
          prettier = {
            prepend_args = { "--tab-width", "2" },
          },
        },
      })

      -- Manual format keymap
      vim.keymap.set({ "n", "v" }, "<leader>f", function()
        require("conform").format({
          lsp_fallback = true,
          async = false,
          timeout_ms = 500,
        })
      end, { desc = "Format file or range" })
    end,
  },
}
