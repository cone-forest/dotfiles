return {
  -- {
  --   'hrsh7th/nvim-cmp',
  --   ft = 'tex',
  -- },
  -- install LSPs and default configurations
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
  -- load configurations
  {
    'neovim/nvim-lspconfig',
    config = function()
      local lspconfig = require('lspconfig')
      lspconfig.rust_analyzer.setup({})
      lspconfig.clangd.setup({})
      lspconfig.pyright.setup({})
      lspconfig.gopls.setup({})
      lspconfig.lua_ls.setup({})
      lspconfig.matlab.setup({})
      lspconfig.cmake.setup({
        on_attach = function(client, _)
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false
        end,
      })
    end
  },
  -- whole lotta snippets
  { 'ms-jpq/coq.artifacts', },
  -- cmp.nvim but faster
  {
    'ms-jpq/coq_nvim',
    branch = 'coq',
    event = "InsertEnter",
    dependencies = {
      'neovim/nvim-lspconfig',
      'ms-jpq/coq.artifacts',
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'Civitasv/cmake-tools.nvim',
      -- better LSP code actions
      {
        "aznhe21/actions-preview.nvim",
        config = function() vim.keymap.set({ "v", "n" }, "<leader>ca", require("actions-preview").code_actions) end,
      },
    },
    keys = {
      'c-l',
    },
    config = function()
      vim.g.coq_settings = {
        ['keymap.jump_to_mark'] = '<c-l>',
      }

      local lsp = require('lspconfig')
      local coq = require('coq')

      local on_attach = function(client, bufnr)
        local opts = {buffer = bufnr, remap = false}

        vim.keymap.set("n", "gdf", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gdc", vim.lsp.buf.declaration, opts)
        -- vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>rf", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("i", "<c-h>", vim.lsp.buf.signature_help, opts)
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
        on_attach = on_attach,
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
  {
    'ms-jpq/coq.thirdparty',
    config = function()
      require("coq_3p") {
        { src = "nvimlua", short_name = "nLUA" },
        -- { src = "vimtex",  short_name = "vTEX" },
        {
          src = "repl",
          sh = "zsh",
          shell = { p = "python", n = "node"},
          max_lines = 99,
          deadline = 500,
          unsafe = { "rm", "poweroff", "mv", "reboot"}
        },
        { src = "bc", short_name = "MATH", precision = 6 },
      }
    end
  }
}
