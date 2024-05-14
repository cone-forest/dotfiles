local get_current_theme = function()
  return 'rose-pine'
end

local configure_colorscheme = function()
  vim.cmd('colorscheme ' .. get_current_theme())
end

return {
  {
    "mbrea-c/wal-colors.nvim",
    name = 'mbc',
    config = configure_colorscheme,
    priority = 1000,
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = configure_colorscheme,
    priority = 1000,
  },
}
