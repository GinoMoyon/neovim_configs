-- ~/.config/nvim/lua/plugins/neo-tree.lua
-- File explorer sidebar (like VSCode file tree)

return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    cmd = "Neotree",
    keys = {
      { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle file explorer" },
      { "<leader>o", "<cmd>Neotree focus<cr>", desc = "Focus file explorer" },
    },

    config = function()
      require("neo-tree").setup({
        close_if_last_window = true,  -- Close Neo-tree if it's the last window
        popup_border_style = "rounded",

        default_component_configs = {
          indent = {
            padding = 0,
          },
          icon = {
            folder_closed = "",
            folder_open = "",
            folder_empty = "",
          },
          git_status = {
            symbols = {
              -- Change type
              added     = "✚",
              deleted   = "✖",
              modified  = "",
              renamed   = "󰁕",
              -- Status type
              untracked = "",
              ignored   = "",
              unstaged  = "󰄱",
              staged    = "",
              conflict  = "",
            }
          },
        },

        window = {
          width = 30,
          mappings = {
            ["<space>"] = "none",  -- Disable space in neo-tree so it doesn't conflict with leader
            ["o"] = "open",
            ["<cr>"] = "open",
            ["s"] = "open_split",
            ["v"] = "open_vsplit",
            ["t"] = "open_tabnew",
            ["C"] = "close_node",
            ["z"] = "close_all_nodes",
            ["R"] = "refresh",
            ["a"] = "add",
            ["d"] = "delete",
            ["r"] = "rename",
            ["c"] = "copy",
            ["x"] = "cut",
            ["p"] = "paste",
            ["y"] = "copy_to_clipboard",
          },
        },

        filesystem = {
          follow_current_file = {
            enabled = true,
          },
          use_libuv_file_watcher = true,  -- Auto-refresh on file changes (deprecated but still works)
          filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = false,
            hide_by_name = {
              "node_modules",
              ".git",
            },
          },
        },

        event_handlers = {
          {
            event = "file_opened",
            handler = function()
              require("neo-tree.command").execute({ action = "close" })
            end
          },
        },
      })
    end,
  },
}
