return {
  {
    'williamboman/mason-lspconfig.nvim',
    lazy = true,
    opts = {
      automatic_installation = true,
      ensure_installed = {
        "gopls", "pyright", "clangd", "lua_ls",
      }
    },
    dependencies = {
      { 'mason.nvim', opts = {} },
    },
  },
  {
    'mfussenegger/nvim-lint',
    keys = { '<leader>L', },
    config = function()
      vim.keymap.set('n', '<leader>L', function() require('lint').try_lint() end)
    end
  },
}
