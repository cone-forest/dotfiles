return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",

      -- adapters
      "alfaix/neotest-gtest",
    },
    keys = {
      '<leader>tr',
      '<leader>td',
      '<leader>tm',
      '<leader>tr',
    },
    config = function()
      local neotest = require('neotest')
      neotest.setup({
        adapters = {
          require("neotest-gtest").setup({}),
        },
      })

      -- neotest plugin
      vim.keymap.set('n', '<leader>tr', function() neotest.run.run() end)
      vim.keymap.set('n', '<leader>td', function() neotest.run.run({strategy = "dap"}) end)
      vim.keymap.set('n', '<leader>tm', function() neotest.summary.open() end)
    end,
  },
}
