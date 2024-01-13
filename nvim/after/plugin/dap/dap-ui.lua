local dap = require('dap')
local dapui = require("dapui")
local telescope = require('telescope')
local daptext = require("nvim-dap-virtual-text")

vim.fn.sign_define(
  "DapBreakpoint",
  { text = "●", texthl = "", linehl = "", numhl = "debugBreakpoint" }
)
vim.fn.sign_define(
  "DapBreakpointCondition",
  { text = "◆", texthl = "", linehl = "", numhl = "debugBreakpoint" }
)

vim.fn.sign_define("DapStopped", { text = "▶", texthl = "", linehl = "", numhl = "debugPC" })
dap.defaults.fallback.force_external_terminal = true
daptext.setup()
dapui.setup({
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
})

dap.listeners.after.event_initialized.dapui_config = function() dapui.open() end
dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
dap.listeners.before.event_exited.dapui_config = function() dapui.close() end

telescope.load_extension('dap')
