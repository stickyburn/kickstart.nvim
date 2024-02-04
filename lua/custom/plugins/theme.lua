return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  config = function()
    require('catppuccin').setup {
      color_overrides = {
        all = {
          base = '#362e45',
          crust = '#362e45',
        },
      },
    }

    vim.cmd.colorscheme 'catppuccin'
  end,
}
