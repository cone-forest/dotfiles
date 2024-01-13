local dap = require('dap')

dap.adapters = {
  python = {
    type = 'executable';
    command = 'python',
    args = { '-m', 'debugpy.adapter' };
  },
  codelldb = {
    type = 'server',
    port = "${port}",
    executable = {
      command = 'codelldb',
      args = {"--port", "${port}"},
    },
  },
 }

dap.configurations.python = {{
  name = "debugpy",
  type = "python",
  request = "launch",
  program = "${file}",
  -- pythonPath = function()
  --   return '/usr/bin/python'
  -- end,
}}
-- dap.configurations.go = {{type = "go"}}
-- dap.configurations.lua = {{type = "lua"}}
