-- ~/.config/nvim/lua/plugins/autopairs.lua
-- Auto-close brackets, quotes, etc.

return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/nvim-cmp",  -- Required for CMP integration
    },
    config = function()
      local autopairs = require("nvim-autopairs")
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp = require("cmp")

      autopairs.setup({
        check_ts = true,  -- Use treesitter
        ts_config = {
          lua = {'string'},
          javascript = {'template_string'},
        },
      })

      -- Integrate with nvim-cmp
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },
}
