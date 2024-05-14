return {
  -- lint current buffer/selection
  {
    'mfussenegger/nvim-lint',
    keys = { '<leader>L', },
    config = function()
      vim.keymap.set('n', '<leader>L', function() require('lint').try_lint() end)
    end
  },
}
