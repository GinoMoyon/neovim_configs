-- ~/.config/nvim/lua/plugins/mini_ai.lua
return {
  "echasnovski/mini.ai",
  version = false, -- always latest
  event = "VeryLazy",
  config = function()
    local ai = require("mini.ai")
    local gen_spec = ai.gen_spec

    ai.setup({
      n_lines = 200, -- how far it searches around cursor

      custom_textobjects = {
        -- Function
        f = gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }),

        -- Class
        c = gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }),

        -- Block (useful for `{ ... }` regions)
        b = gen_spec.treesitter({ a = "@block.outer", i = "@block.inner" }),

        -- Conditionals: if/else blocks
        o = gen_spec.treesitter({ a = "@conditional.outer", i = "@conditional.inner" }),

        -- Loops: for/while
        l = gen_spec.treesitter({ a = "@loop.outer", i = "@loop.inner" }),

        -- Parameters/arguments (often works well in TS/Python)
        p = gen_spec.treesitter({ a = "@parameter.outer", i = "@parameter.inner" }),
      },
    })
  end,
}

