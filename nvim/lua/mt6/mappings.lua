-- explorer
vim.keymap.set('n', '<leader>;', '<cmd> Explore <CR>')

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

-- tmux
vim.keymap.set('n', '<C-h>', '<Cmd>NvimTmuxNavigateLeft<CR>')
vim.keymap.set('n', '<C-j>', '<Cmd>NvimTmuxNavigateDown<CR>')
vim.keymap.set('n', '<C-k>', '<Cmd>NvimTmuxNavigateUp<CR>')
vim.keymap.set('n', '<C-l>', '<Cmd>NvimTmuxNavigateRight<CR>')
vim.keymap.set('n', '<C-\\>', '<Cmd>NvimTmuxNavigateLastActive<CR>')
vim.keymap.set('n', '<C-Space>', '<Cmd>NvimTmuxNavigateNext<CR>')

-- telescope plugin
vim.keymap.set('n', '<leader>ff', '<cmd> Telescope find_files <CR>')
vim.keymap.set('n', '<leader>fs', '<cmd> Telescope live_grep <CR>')
vim.keymap.set('n', '<leader>fc', '<cmd> Telescope colorscheme <CR>')

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
