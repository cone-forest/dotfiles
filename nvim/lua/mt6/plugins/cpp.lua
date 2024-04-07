return {
  {
    'Civitasv/cmake-tools.nvim',
    ft = {'cpp', 'hpp', 'h', 'c', 'cmake', 'txt'},
    commands = {
      'CMakeGenerate',
      'CMakeGenerate!',
      'CMakeBuild',
      'CMakeBuild!',
      'CMakeRun',
      'CMakeDebug',
      'CMakeRunTest',
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
}
