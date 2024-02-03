vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

return {
  "nvim-neo-tree/neo-tree.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require('neo-tree').setup {
      close_if_last_window = true,
      popup_border_style = "rounded",
      enable_git_status = true,
      enable_diagnostics = false,
      default_component_configs = {
        indent = {
          padding = 1,
        },
      },
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
        },
        follow_current_file_enabled = true,
        use_libuv_file_watcher = true,
      },
      event_handlers = {
        {
          event = "file_opened",
          handler = function()
            require("neo-tree").close_all()
          end,
        },
      },
      mappings = {
        ["<CR>"] = "open",
        ["<2-LeftMouse>"] = "open",
        ["<2-RightMouse>"] = "open_with_window_picker",
        ["<Right>"] = "open_node",
        ["<Left>"] = "close_node",
        ["."] = "toggle_hidden",
        ["R"] = "refresh",
      },
    }
    vim.keymap.set('n', '<C-e>', ':Neotree toggle filesystem reveal right<CR>')
  end,
}
