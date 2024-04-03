--[[
return {
  {
    'mfussenegger/nvim-dap',
    lazy = true,
    config = function()
      local dap = require('dap')
      dap.adapters = {
        python = {
          type = 'executable',
          command = 'python',
          args = { '-m', 'debugpy.adapter' },
        },
        codelldb = {
          type = 'server',
          port = '${port}',
          executable = {
            command = 'codelldb',
            args = {'--port', '${port}'},
          },
        },
        configurations = {
          python = {{
            name = 'debugpy',
            type = 'python',
            request = 'launch',
            program = '${file}',
          }},
          go = {{type = 'go'}},
          lua = {{type = 'lua'}},
        },
      }
    end,
  },
  {
    'rcarriga/nvim-dap-ui',
    -- lazy = true,
    dependencies = {
      'mfussenegger/nvim-dap',
      'nvim-telescope/telescope.nvim',
      'nvim-telescope/telescope-dap.nvim',
      'theHamsta/nvim-dap-virtual-text'
    },
    opts = {
      layouts = {
        {
          elements = {
            "watches",
            { id = "scopes", size = 0.5 },
            { id = "repl", size = 0.15 },
          },
          size = 79,
          position = "left",
        },
        {
          elements = {
            "console",
          },
          size = 0.25,
          position = "bottom",
        },
      },
    },
    config = function()
      local dap = require('dap')
      local dapui = require("dapui")
      local telescope = require('telescope')
      local daptext = require("nvim-dap-virtual-text")

      vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "", linehl = "", numhl = "debugBreakpoint" })
      vim.fn.sign_define("DapBreakpointCondition", { text = "◆", texthl = "", linehl = "", numhl = "debugBreakpoint" })
      vim.fn.sign_define("DapStopped", { text = "▶", texthl = "", linehl = "", numhl = "debugPC" })

      dap.defaults.fallback.force_external_terminal = true

      dap.listeners.after.event_initialized.dapui_config = dapui.open
      dap.listeners.before.event_terminated.dapui_config = dapui.close
      dap.listeners.before.event_exited.dapui_config = dapui.close
    end
  },
  {
    'theHamsta/nvim-dap-virtual-text',
    -- lazy = true,
    opts = {},
    dependencies = { 'mfussenegger/nvim-dap' },
  },
  {
    'nvim-telescope/telescope-dap.nvim',
    -- lazy = true,
    opts = {},
    dependencies = {
      'nvim-telescope/telescope.nvim',
      'mfussenegger/nvim-dap'
    },
    config = function()
      require('telescope').load_extension('dap')
    end
  },
}
--]]

return {
  {
    "mfussenegger/nvim-dap",
    lazy = true,
    dependencies = {
      {
        "rcarriga/nvim-dap-ui",
        dependencies = { "nvim-neotest/nvim-nio" },
        opts = {},
        keys = { '<F4>', '<F5>', '<F9>', '<F10>', '<F11>', },
        config = function(_, opts)
          local dap = require("dap")
          local dapui = require("dapui")

          dapui.setup(opts)

          dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open({}) end
          dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close({}) end
          dap.listeners.before.event_exited["dapui_config"] = function() dapui.close({}) end

          vim.keymap.set('n', '<F5>', '<cmd> DapContinue <CR>')
          vim.keymap.set('n', '<F4>', '<cmd> DapTerminate <CR>')
          vim.keymap.set('n', '<F10>', '<cmd> DapStepOver <CR>')
          vim.keymap.set('n', '<F11>', '<cmd> DapStepInto <CR>')
          vim.keymap.set('n', '<F9>', '<cmd> DapToggleBreakpoint <CR>')

          vim.fn.sign_define( "DapBreakpoint", { text = "●", texthl = "", linehl = "", numhl = "debugBreakpoint" })
          vim.fn.sign_define( "DapBreakpointCondition", { text = "◆", texthl = "", linehl = "", numhl = "debugBreakpoint" })
          vim.fn.sign_define("DapStopped", { text = "▶", texthl = "", linehl = "", numhl = "debugPC" })
          dap.defaults.fallback.force_external_terminal = true
        end,
      },
      { "theHamsta/nvim-dap-virtual-text", },
      {
        'nvim-telescope/telescope.nvim',
        dependencies = {'nvim-telescope/telescope.nvim'},
        config = function ()
          require('telescope').load_extension('dap')
        end,
      },
      {
        'ay-babu/mason-nvim-dap.nvim',
        dependencies = 'mason.nvim',
        cmd = { 'DapInstall', 'DapUninstall' },
        opts = {
          automatic_installation = true,

          -- You can provide additional configuration to the handlers,
          -- see mason-nvim-dap README for more information
          handlers = {
            python = function(config)
              config.adapters = {
                type = 'executable',
                command = 'python',
                args = { '-m', 'debugpy.adapter', },
              }
              config.configurations.python = {{
                  name = 'debugpy',
                  type = 'python',
                  request = 'launch',
                  program = '${file}',
                }
              }
              require('mason-nvim-dap').default_setup(config) -- don't forget this!
            end,
            codelldb = function(config)
              config.adapters = {
                type = 'server',
                port = '${port}',
                executable = {
                  command = 'codelldb',
                  args = {'--port', '${port}'},
                },
              }
              config.configurations.cpp = {
                name = "Launch",
                type = "codelldb",
                request = "launch",
                program = function()
                  return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/build/', 'file')
                end,
                cwd = '${workspaceFolder}',
                stopOnEntry = false,
              }
              require('mason-nvim-dap').default_setup(config) -- don't forget this!
            end,
            -- default setup
            function(config)
              require('mason-nvim-dap').default_setup(config)
            end,
          },
          ensure_installed = {
          },
        },
      },
    },
  },
}
