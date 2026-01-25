-- ~/.config/nvim/lua/plugins/comment.lua
-- Toggle comments easily with gcc and gc

return {
  {
    "numToStr/Comment.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    config = function()
      require("Comment").setup({
        -- Use treesitter for context-aware commenting
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      })
    end,
  },

  -- Context-aware commenting for JSX, Vue, etc.
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    lazy = true,  -- Loaded as dependency of Comment.nvim
  },
}
