vim.g.mkdp_browser = 'surf'

return {
  {
    "iamcco/markdown-preview.nvim",
    event = VeryLazy,
    config = function() vim.fn["mkdp#util#install"]() end,
  },
}
