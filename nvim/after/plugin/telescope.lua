local telescope = require('telescope')
local builtin = require('telescope.builtin')

telescope.load_extension('harpoon')
vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>s', function()
	builtin.grep_string({search = vim.fn.input("")})
end)

