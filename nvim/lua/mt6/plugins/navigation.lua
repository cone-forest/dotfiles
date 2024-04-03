return {
  {'aserowy/tmux.nvim', opts = {}},
  {
    'stevearc/oil.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = { '<leader>;' },
    config = function()
      local oil = require('oil')
      oil.setup({
        float = {
          padding = 0,
          max_width = 55,
          max_height = 18,
          border = "rounded",
          win_options = { winblend = 0, },
        },
      })
      vim.keymap.set('n', '<leader>;', oil.toggle_float)
    end
  },
  {
    'nvim-telescope/telescope.nvim',
    keys = {'<leader>ff', '<leader>fs', '<leader>fc'},
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files)
      vim.keymap.set('n', '<leader>fs', builtin.live_grep)
      vim.keymap.set('n', '<leader>fc', builtin.colorscheme)
    end
  },
  {
    'ThePrimeagen/harpoon',
    branch = "harpoon2",
    lazy = true,
    dependencies = {
      'nvim-telescope/telescope.nvim',
      'nvim-lua/plenary.nvim',
    },
    keys = {
      '<leader>a',
      '<leader>h',
      '<leader>1',
      '<leader>2',
      '<leader>9',
      '<leader>0',
    },
    config = function()
      require('telescope').load_extension('harpoon')
      local harpoon = require('harpoon')
      harpoon:setup({
        settings = {
          save_on_toggle = true,
          sync_on_ui_close = true,
          key = function()
            return vim.loop.cwd()
          end,
        }
      })

      -- basic telescope configuration
      local conf = require("telescope.config").values
      local function toggle_telescope(harpoon_files)
        local file_paths = {}
        for _, item in ipairs(harpoon_files.items) do
          table.insert(file_paths, item.value)
        end

        require("telescope.pickers").new({}, {
          prompt_title = "Harpoon",
          finder = require("telescope.finders").new_table({
            results = file_paths,
          }),
          previewer = conf.file_previewer({}),
          sorter = conf.generic_sorter({}),
        }):find()
      end

      vim.keymap.set('n', '<leader>a', function() harpoon:list():add() end)
      vim.keymap.set('n', '<leader>h', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
      vim.keymap.set('n', '<leader>fh', function() toggle_telescope(harpoon:list()) end)

      vim.keymap.set('n', '<leader>1', function() harpoon:list():select(1) end)
      vim.keymap.set('n', '<leader>2', function() harpoon:list():select(2) end)
      vim.keymap.set('n', '<leader>9', function() harpoon:list():select(3) end)
      vim.keymap.set('n', '<leader>0', function() harpoon:list():select(4) end)
    end
  },
  {'folke/trouble.nvim', cmd = "Trouble"}
}
