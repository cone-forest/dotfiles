return {
  {
    'williamboman/mason.nvim',
    opts = {}
  },
  {
    'williamboman/mason-lspconfig.nvim',
    lazy = true,
    opts = {
      automatic_installation = true,
      ensure_installed = {
        "gopls", "pyright", "clangd", "lua_ls",
      }
    },
    dependencies = { 'mason.nvim', },
  },
  {
    'williamboman/mason-nvim-dap.nvim',
    lazy = true,
    opts = {
      automatic_installation = true,
      ensure_installed = {
        'codelldb', 'debugpy',
      }
    },
    dependencies = { 'mason.nvim', },
  },
}
