-- leader
vim.g.mapleader = ' '

-- relative line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

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
vim.highlight.on_yank({higroup="IncSearch", timeout=700})

vim.opt.spell = true
vim.opt.spelllang = "en_us"
