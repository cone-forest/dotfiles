-- quit & save
vim.keymap.set('n', '<leader>q', '<cmd> q <CR>')
vim.keymap.set('n', '<leader>w', '<cmd> w <CR>')
vim.keymap.set('n', '<leader>wq', '<cmd> wqa <CR>')

-- move selected lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keep search results in the middle
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- replace from buffer
vim.keymap.set('x', '<leader>i', '"_dP')

-- system and vim clipboard overlap
vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>Y', '"+Y')

vim.keymap.set('n', '<leader>p', '"+p')
vim.keymap.set('v', '<leader>p', '"+p')
vim.keymap.set('n', '<leader>P', '"+P')

-- splits
vim.keymap.set('n', '<leader>"', '<cmd> split <CR>')
vim.keymap.set('n', '<leader>%', '<cmd> vsplit <CR>')

-- diagnostics
vim.keymap.set('n', 'L', vim.diagnostic.open_float)

-- code actions
vim.keymap.set({ 'v', 'n' }, '<leader>ca', require('actions-preview').code_actions)
