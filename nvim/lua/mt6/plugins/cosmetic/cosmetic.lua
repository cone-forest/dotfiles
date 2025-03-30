return {
  -- special icons
  { 'nvim-tree/nvim-web-devicons' },

  -- highlighting
  {
    'nvim-treesitter/nvim-treesitter',
    event = 'BufEnter',
    config = function()
      local tsconf = require('nvim-treesitter.configs')
      tsconf.setup({
        ensure_installed = { "python", "go", "glsl", "hlsl", "cmake", "lua", },
        modules = {},
        ignore_install = { "c", "cpp" },
        sync_install = true,
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = true
        },
      })
    end
  },

  -- startpage
  {
    'goolord/alpha-nvim',
    opts = {
      layout = {
        {type = 'padding', val = 20,},
        {
          type = 'text',
          val = 'ᓚᘏᗢ',
          opts = {
            position = 'center',
          },
        },
        {type = 'padding', val = 47,},
      },
    },
  },

  -- the rest of file is lualine config
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }, -- optional for icons
    config = function()
      require('lualine').setup({
        options = {
          theme = 'auto',
          component_separators = '|',
          section_separators = '',
        },
        sections = {
          lualine_a = {'mode'},
          lualine_b = {'filename'},
          lualine_c = {},
          lualine_x = {'filetype'},
          lualine_y = {'progress'},
          lualine_z = {'location'}
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {'filename'},
          lualine_x = {'location'},
          lualine_y = {},
          lualine_z = {}
        },
      })
    end
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },

  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      bigfile = { enabled = true },
      -- dashboard = { enabled = true },
      -- explorer = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      -- picker = { enabled = true },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      scope = { enabled = true },
      -- scroll = { enabled = true },
      -- statuscolumn = { enabled = true },
      -- words = { enabled = true },
    },
    keys = {
      { "<leader>l", function() Snacks.lazygit() end, desc = "Lazygit" },
      { "<c-/>",      function() Snacks.terminal() end, desc = "Toggle Terminal" },
    },
  }
}
