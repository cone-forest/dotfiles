return {
  {
    'kdheepak/lazygit.nvim',
    keys = {
      {'<leader>l', '<cmd> LazyGit <CR>'}
    },
  },
  { 'f-person/git-blame.nvim', },
  {
    'akinsho/git-conflict.nvim',
    keys = {
      {'<leader>gc', function() vim.cmd('GitConflictListQf') end}
    },
    config = true
  },
  { 'lewis6991/gitsigns.nvim' },
  { 'mbbill/undotree', },
}
