return {
  {
    "vague2k/huez.nvim",
    import = "huez-manager.import",
    config = function()
      require("huez").setup({})
      vim.keymap.set('n', '<leader>fc', function() vim.cmd('Huez') end)
    end,
  }
}
