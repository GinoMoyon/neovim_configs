-- ~/.config/nvim/lua/plugins/treesitter.lua
return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false, -- treesitter should not be lazy-loaded
    build = ":TSUpdate",

    config = function()
      -- Install parsers
      require("nvim-treesitter").install({
        "lua", "vim", "vimdoc", "python", "javascript", "typescript", "tsx"
      })

      -- Enable treesitter highlighting for common filetypes
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "lua", "vim", "python", "javascript", "typescript", "typescriptreact", "javascriptreact" },
        callback = function()
          vim.treesitter.start()
        end,
      })

      -- Enable treesitter-based folding
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "lua", "vim", "python", "javascript", "typescript", "typescriptreact", "javascriptreact" },
        callback = function()
          vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
          vim.wo[0][0].foldmethod = "expr"
        end,
      })
    end,
  },
}
