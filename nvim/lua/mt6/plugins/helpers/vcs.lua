return {
  -- neovim git client
  {
    'kdheepak/lazygit.nvim',
    keys = {
      {'<leader>l', '<cmd> LazyGit <CR>'}
    },
  },
  -- show git blame for current line
  { 'f-person/git-blame.nvim', },
  {
    'akinsho/git-conflict.nvim',
    keys = {
      {'<leader>gc', function() vim.cmd('GitConflictListQf') end}
    },
    config = true
  },
  -- shows current file git state
  { 'lewis6991/gitsigns.nvim' },
  -- shows tree of current file's changes in a tree
  { 'mbbill/undotree' },
}
