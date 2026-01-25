-- ~/.config/nvim/lua/plugins/lualine.lua
-- Status line (like VSCode bottom bar)

return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",

    config = function()
      require("lualine").setup({
        options = {
          theme = "auto",  -- Match colorscheme
          component_separators = { left = "", right = ""},
          section_separators = { left = "", right = ""},
          globalstatus = true,  -- Single statusline for all windows
        },
        sections = {
          lualine_a = {'mode'},
          lualine_b = {'branch', 'diff', 'diagnostics'},
          lualine_c = {
            {
              'filename',
              path = 1,  -- Relative path
            }
          },
          lualine_x = {'encoding', 'fileformat', 'filetype'},
          lualine_y = {'progress'},
          lualine_z = {'location'}
        },
      })
    end,
  },
}
