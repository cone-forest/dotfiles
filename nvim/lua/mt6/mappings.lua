vim.keymap.set('n', '<leader>;', vim.cmd.Ex)

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

-- trouble plugin
vim.keymap.set('n', '<leader>t', '<cmd> TroubleToggle <CR>')

-- dap plugin
vim.keymap.set('n', '<F5>', '<cmd> DapContinue <CR>')
vim.keymap.set('n', '<F4>', '<cmd> DapTerminate <CR>')
vim.keymap.set('n', '<F10>', '<cmd> DapStepOver <CR>')
vim.keymap.set('n', '<F11>', '<cmd> DapStepInto <CR>')
vim.keymap.set('n', '<F12>', '<cmd> DapStepOut <CR>')
vim.keymap.set('n', '<F9>', '<cmd> DapToggleBreakpoint <CR>')

-- undotree plugin
vim.keymap.set('n', '<leader>u', '<cmd> UndotreeToggle <CR>')

-- lazygit plugin
vim.keymap.set('n', '<leader>l', '<cmd> LazyGit <CR>')

-- harpoon plugin
vim.keymap.set('n', '<leader>a', ':lua require("harpoon.mark").add_file() <CR>')
vim.keymap.set('n', '<leader>h', ':lua require("harpoon.ui").toggle_quick_menu() <CR>')

vim.keymap.set('n', '<leader>1', ':lua require("harpoon.ui").nav_file(1) <CR>')
vim.keymap.set('n', '<leader>2', ':lua require("harpoon.ui").nav_file(2) <CR>')
vim.keymap.set('n', '<leader>9', ':lua require("harpoon.ui").nav_file(3) <CR>')
vim.keymap.set('n', '<leader>0', ':lua require("harpoon.ui").nav_file(4) <CR>')

vim.keymap.set('n', '<leader>n', ':lua require("harpoon.ui").nav_next() <CR>')
vim.keymap.set('n', '<leader>N', ':lua require("harpoon.ui").nav_prev() <CR>')
