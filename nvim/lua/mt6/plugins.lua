vim.pack.add({
  { src = 'https://github.com/stevearc/oil.nvim', },
  { src = 'https://github.com/nvim-tree/nvim-web-devicons', },
  { src = 'https://github.com/nvim-lua/plenary.nvim', },
  { src = 'https://github.com/nvim-telescope/telescope.nvim', },
  { src = 'https://github.com/neovim/nvim-lspconfig', },
  { src = 'https://github.com/lervag/vimtex', },
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter', },
  { src = 'https://github.com/folke/tokyonight.nvim', },
  { src = 'https://github.com/iamcco/markdown-preview.nvim', },
  { src = 'https://github.com/aznhe21/actions-preview.nvim', },
  -- { src = 'https://github.com/ThePrimeagen/harpoon', version = 'harpoon2', },
})

-- colorscheme configuration
vim.cmd('colorscheme tokyonight-night')

-- file tree configuration
require('oil').setup({
  skip_confirm_for_simple_edits = true,
  natural_order = true,
  float = {
    padding = 0,
    max_width = 55,
    max_height = 18,
    border = "rounded",
    win_options = { winblend = 0, },
  },
})
vim.keymap.set('n', '<leader>;', '<cmd>Oil --float<cr>')

-- fuzzy finder (telescope) configuration
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files)
vim.keymap.set('n', '<leader>fs', builtin.live_grep)

-- harpoon configuration
-- local conf = require("telescope.config").values
-- local function toggle_telescope(harpoon_files)
--   local file_paths = {}
--   for _, item in ipairs(harpoon_files.items) do
--     table.insert(file_paths, item.value)
--   end
-- 
--   require("telescope.pickers").new({}, {
--     prompt_title = "Harpoon",
--     finder = require("telescope.finders").new_table({
--       results = file_paths,
--     }),
--     previewer = conf.file_previewer({}),
--     sorter = conf.generic_sorter({}),
--   }):find()
-- end
--
-- require('telescope').load_extension('harpoon')
-- local harpoon = require('harpoon')
-- harpoon:setup({
--   settings = {
--     save_on_toggle = true,
--     sync_on_ui_close = true,
--     key = function()
--       return vim.loop.cwd()
--     end,
--   }
-- })
--
-- vim.keymap.set('n', '<leader>a', function() harpoon:list():add() end)
-- vim.keymap.set('n', '<leader>h', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
-- vim.keymap.set('n', '<leader>fh', function() toggle_telescope(harpoon:list()) end)
--
-- vim.keymap.set('n', '<leader>1', function() harpoon:list():select(1) end)
-- vim.keymap.set('n', '<leader>2', function() harpoon:list():select(2) end)
-- vim.keymap.set('n', '<leader>9', function() harpoon:list():select(3) end)
-- vim.keymap.set('n', '<leader>0', function() harpoon:list():select(4) end)

-- LSP configuration
vim.lsp.enable({
  'lua_ls',
  'clangd',
  'texlab',
})
vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      workspace = {
        library = vim.api.nvim_get_runtime_file('', true),
      }
    }
  }
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client ~= nil and client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end
  end,
})
vim.cmd('set completeopt+=noselect')

-- Tree Sitter configuration
require('nvim-treesitter.configs').setup({
  ensure_installed = { 'c', 'cpp', 'glsl', 'slang', 'lua', },
  highlight = { enable = true, },
})

-- Markdown Preview configuration
vim.fn["mkdp#util#install"]()
