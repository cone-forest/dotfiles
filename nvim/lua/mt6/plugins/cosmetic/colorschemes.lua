-- local get_current_theme = function()
--   return 'mbc'
-- end
--
-- local configure_colorscheme = function()
--   vim.cmd('colorscheme ' .. get_current_theme())
-- end

return {
  -- {
  --   "mbrea-c/wal-colors.nvim",
  --   name = 'mbc',
  --   config = configure_colorscheme,
  --   priority = 1000,
  -- },
  {
    "vague2k/huez.nvim",
    import = "huez-manager.import",
    config = function()
      require("huez").setup({})
      vim.keymap.set('n', '<leader>fc', function() vim.cmd('Huez') end)
    end,
  }
}
