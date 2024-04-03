return {
  { 'ms-jpq/coq.artifacts', },
  {
    'neovim/nvim-lspconfig',
    -- event = 'BufEnter',
    config = function()
      local lspconfig = require('lspconfig')
      lspconfig.rust_analyzer.setup({})
      lspconfig.clangd.setup({})
      lspconfig.pyright.setup({})
      lspconfig.gopls.setup({})
      lspconfig.lua_ls.setup({})
    end
  },
  {
    'ms-jpq/coq_nvim',
    branch = 'coq',
    event = "InsertEnter",
    dependencies = {
      'neovim/nvim-lspconfig',
      'ms-jpq/coq.artifacts',
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      {
        'Civitasv/cmake-tools.nvim',
        lazy = false,
        keys = {
          '<leader>g', '<leader>G',
          '<leader>b', '<leader>B',
          '<leader>R', '<leader>D',
        },
        config = function ()
          require('cmake-tools').setup({})
          vim.keymap.set('n', '<leader>g', '<cmd> CMakeGenerate <CR>')
          vim.keymap.set('n', '<leader>b', '<cmd> CMakeBuild <CR>')
          vim.keymap.set('n', '<leader>G', '<cmd> CMakeGenerate! <CR>')
          vim.keymap.set('n', '<leader>B', '<cmd> CMakeBuild! <CR>')
          vim.keymap.set('n', '<leader>R', '<cmd> CMakeRun <CR>')
          vim.keymap.set('n', '<leader>D', '<cmd> CMakeDebug <CR>')
        end
      },
    },
    config = function()
      local lsp = require('lspconfig')
      local coq = require('coq')

      local on_attach = function(client, bufnr)
        local opts = {buffer = bufnr, remap = false}

        vim.keymap.set("n", "gdf", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gdc", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>rf", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
      end
      -- coq.clients.tabnine.enabled=true
      lsp.clangd.setup(coq.lsp_ensure_capabilities({
        on_attach = on_attach,
        on_new_config = function(new_config, new_cwd)
          local cmake = require('cmake-tools')
          cmake.clangd_on_new_config(new_config)
        end,
      }))
      lsp.lua_ls.setup(coq.lsp_ensure_capabilities({
        settings = {
          Lua = {
            diagnostics = { globals = { 'vim', 'require' }, },
            workspace = { library = vim.api.nvim_get_runtime_file("", true), },
            telemetry = { enable = false, },
          },
        },
      }))
      vim.cmd('COQnow -s')
    end
  },
}
