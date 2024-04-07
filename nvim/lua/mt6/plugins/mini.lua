ConfigureHueTheme = function()
  local bghandle = io.popen([[
  source ~/.config/hypr/theme/current.bash
  printf "%s" $background
  ]])
  local bg = 'empty'
  if bghandle ~= nil then
    bg = bghandle:read("*a")
    bghandle:close()
  end

  local fghandle = io.popen([[
  source ~/.config/hypr/theme/current.bash
  printf "%s" $foreground
  ]])
  local fg = 'empty'
  if fghandle ~= nil then
    fg = fghandle:read("*a")
    fghandle:close()
  end

  local hues = require('mini.hues')
  hues.setup({
    background = bg,
    foreground = fg,
    n_hues = 8,
    saturation = 'high',
  })
  require('lualine').setup({})
end

vim.cmd('command! UpdateHueTheme :lua ConfigureHueTheme()')

return {
  {
    'echasnovski/mini.hues',
    dependencies = {
      'lualine.nvim'
    },
    config = ConfigureHueTheme
  },
}

