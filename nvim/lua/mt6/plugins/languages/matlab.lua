vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.m",
  callback = function()
    vim.bo.filetype = "octave"
  end,
})

return {}
