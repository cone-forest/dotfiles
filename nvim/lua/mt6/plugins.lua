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
  { src = 'https://github.com/christoomey/vim-tmux-navigator', },
  { src = 'https://github.com/goolord/alpha-nvim', },
  { src = 'https://github.com/mbbill/undotree' },
  { src = 'https://github.com/cbochs/grapple.nvim', },
  { src = 'https://github.com/folke/trouble.nvim', },
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

vim.keymap.set('n', '<c-h>', '<cmd>TmuxNavigateLeft<cr>')
vim.keymap.set('n', '<c-j>', '<cmd>TmuxNavigateDown<cr>')
vim.keymap.set('n', '<c-k>', '<cmd>TmuxNavigateUp<cr>')
vim.keymap.set('n', '<c-l>', '<cmd>TmuxNavigateRight<cr>')

-- fuzzy finder (telescope) configuration
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files)
vim.keymap.set('n', '<leader>fs', builtin.live_grep)

-- LSP configuration
vim.lsp.enable({
  'lua_ls',
  'clangd',
  'texlab',
  'pylsp'
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
vim.lsp.config('slangd', {
  settings = {
    slang = {
      inlayHints = {
        deducedTypes = true,
        parameterNames = true,
      }
    }
  }
})
vim.lsp.config('pylsp', {})

local lsp = require('lspconfig')

local on_attach = function(_, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gdf", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gdc", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "<leader>rf", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("i", "<c-h>", vim.lsp.buf.signature_help, opts)
end

lsp.clangd.setup({ on_attach = on_attach, })

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client ~= nil and client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end
  end,
})
vim.cmd('set completeopt+=noselect')

require('trouble').setup({})

vim.keymap.set('n', "<leader>a", "<cmd>Grapple toggle<cr>")
vim.keymap.set('n', "<leader>h", "<cmd>Grapple toggle_tags<cr>")
vim.keymap.set('n', "<leader>1", "<cmd>Grapple select index=1<cr>")
vim.keymap.set('n', "<leader>2", "<cmd>Grapple select index=2<cr>")
vim.keymap.set('n', "<leader>9", "<cmd>Grapple select index=3<cr>")
vim.keymap.set('n', "<leader>0", "<cmd>Grapple select index=4<cr>")
vim.keymap.set('n', "<leader>3", "<cmd>Grapple select index=5<cr>")
vim.keymap.set('n', "<leader>8", "<cmd>Grapple select index=6<cr>")
vim.keymap.set('n', "<c-s-n>", "<cmd>Grapple cycle_tags next<cr>")
vim.keymap.set('n', "<c-s-p>", "<cmd>Grapple cycle_tags prev<cr>")

-- Tree Sitter configuration
require('nvim-treesitter.configs').setup({
  ensure_installed = { 'c', 'cpp', 'glsl', 'slang', 'lua', 'python', 'sql', 'go' },
  highlight = { enable = true, },
})

-- Markdown Preview configuration
vim.fn["mkdp#util#install"]()

-- Start page
require('alpha').setup({
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
})

vim.keymap.set('n', '<leader>u', '<cmd>UndotreeToggle<cr>')
