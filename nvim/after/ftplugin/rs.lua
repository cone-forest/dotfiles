lspconfig = require('lspconfig')
dap = require('dap')

vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
vim.keymap.set("n", "<leader>rf", function() vim.lsp.buf.references() end, opts)
vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

-- vim.keymap.set('n', "<leader>g", '<cmd> CMakeGenerate <CR>')
vim.keymap.set('n', "<leader>b", '<cmd> Cbuild <CR>')
-- vim.keymap.set('n', "<leader>G", '<cmd> CMakeGenerate! <CR>')
vim.keymap.set('n', "<leader>B", '<cmd> Cbuild <CR>')
vim.keymap.set('n', "<leader>R", '<cmd> Crun <CR>')

lspconfig.clangd.setup({
})

dap.configurations.rust = {{
  name = "Launch",
  type = "codelldb",
  request = "launch",
  program = function()
    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
  end,
  cwd = '${workspaceFolder}',
  stopOnEntry = false,
}}
