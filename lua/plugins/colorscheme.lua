-- ~/.config/nvim/lua/plugins/colorscheme.lua
return {
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,    -- Load immediately, not lazy
    priority = 1000, -- Load before other plugins

    config = function()
      require("cyberdream").setup({
        -- Enable transparent background
        transparent = false,

        -- Italic comments
        italic_comments = true,

        -- Replace all fillchars with ' ' for a cleaner look
        hide_fillchars = false,

        -- Modern borderless telescope theme
        borderless_telescope = false,  -- Disable to show borders

        -- Set terminal colors for a consistent look
        terminal_colors = true,

        -- Custom colors
        colors = {
          bg = "#000000",        -- Pure black background
          bgAlt = "#0a0a0a",     -- Slightly lighter black for contrast
          bgHighlight = "#1a1a1a",
          fg = "#ffffff",        -- Pure white foreground for max contrast
          grey = "#7b8496",
        },

        -- High contrast theme options
        theme = {
          variant = "default", -- or "light" for a light theme
          highlights = {
            -- Ensure background is pure black everywhere
            Normal = { bg = "#000000" },
            NormalFloat = { bg = "#000000" },
            SignColumn = { bg = "#000000" },
            StatusLine = { bg = "#000000" },
            TabLine = { bg = "#000000" },

            -- Light blue borders for visibility
            FloatBorder = { fg = "#5DADE2", bg = "#000000" },       -- Light blue borders on modals
            TelescopeBorder = { fg = "#5DADE2", bg = "#000000" },   -- Telescope borders
            TelescopePromptBorder = { fg = "#5DADE2", bg = "#000000" },
            TelescopeResultsBorder = { fg = "#5DADE2", bg = "#000000" },
            TelescopePreviewBorder = { fg = "#5DADE2", bg = "#000000" },
            WinSeparator = { fg = "#5DADE2" },                      -- Window split borders
            VertSplit = { fg = "#5DADE2" },                         -- Vertical splits

            -- Lazy.nvim modal borders (try multiple possible highlight groups)
            LazyNormal = { bg = "#000000" },                        -- Lazy modal background
            LazyBorder = { fg = "#5DADE2", bg = "#000000" },        -- Lazy modal border
            LazyFloatBorder = { fg = "#5DADE2", bg = "#000000" },   -- Alternative border name
            LazyPopupBorder = { fg = "#5DADE2", bg = "#000000" },   -- Alternative border name
          },
        },
      })

      -- Apply the colorscheme
      vim.cmd("colorscheme cyberdream")

      -- Force Lazy.nvim borders to be visible (apply after colorscheme loads)
      vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#5DADE2", bg = "#000000" })
      vim.api.nvim_set_hl(0, "LazyNormal", { bg = "#000000" })
      vim.api.nvim_set_hl(0, "LazyBorder", { fg = "#5DADE2", bg = "#000000" })
    end,
  },
}
