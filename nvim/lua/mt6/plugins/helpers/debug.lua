return {
  -- DAP settings
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
      -- install DAPs and load default configurations
      {
        'ay-babu/mason-nvim-dap.nvim',
        dependencies = {
          { 'mason.nvim', opts = {} },
          { 'cmake-tools.nvim' }
        },
        opts = {
          automatic_installation = true,
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
              -- TODO: this config is not applied, instead default one is used
              config.configurations.cpp = {
                name = "Launch",
                type = "codelldb",
                request = "launch",
                program = function()
                  local cmake = require('cmake-tools')
                  if cmake.is_cmake_project() then
                    return cmake.get_build_directory() .. cmake.get_launch_target()
                  end
                  return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/build/', 'file')
                end,
                cwd = '${workspaceFolder}',
                stopOnEntry = true,
              }
              config.configurations.codelldb = config.configurations.cpp
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
