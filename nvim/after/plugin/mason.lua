require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
    -- go
    "gopls",
    -- python
    "pyright", -- "black", "mypy", "ruff",
    -- cpp
    "clangd", -- "clang-format"
    -- lua
    "lua_ls",
  },
})
require('mason-nvim-dap').setup({
  ensure_installed = {
    'codelldb',
    'debugpy',
    }
})
