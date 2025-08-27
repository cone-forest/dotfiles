-- leader
vim.g.mapleader = ' '

-- relative line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- default browser
vim.g.mkdp_browser = 'surf'

-- indenting
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- backup
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- natural colors
vim.opt.termguicolors = true

vim.opt.scrolloff = 8

-- highlight yanked
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight_yank', {}),
  desc = 'Hightlight selection on yank',
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { higroup = 'IncSearch', timeout = 47 }
  end,
})

vim.opt.spell = true
vim.opt.spelllang = "en_us,ru"

-- rounded corners
vim.opt.winborder = "rounded"
