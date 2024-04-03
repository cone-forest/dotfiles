return {
  {
    'nvim-treesitter/nvim-treesitter',
    event = 'BufEnter',
    config = function()
      local tsconf = require('nvim-treesitter.configs')
      tsconf.setup({
        ensure_installed = { "c", "cpp", "python", "go", "glsl", "hlsl", "cmake", "lua", "vim", "vimdoc", "query" },
        modules = {},
        ignore_install = {"tex"},
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      })
    end
  },
  {
    "themercorp/themer.lua",
    lazy = false,
    config = function() vim.cmd('colorscheme themer_radium') end
  },
  { 'nvim-tree/nvim-web-devicons' }
}
