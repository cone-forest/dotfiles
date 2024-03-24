vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use {'wbthomason/packer.nvim'}

  -- dependencies
  use {'MunifTanjim/nui.nvim'}
  use {'nvim-lua/plenary.nvim'}
  use {'nvim-telescope/telescope.nvim'}
  use {'hrsh7th/vim-vsnip'}

  use {
	  'nvim-treesitter/nvim-treesitter',
	  {run = ':TSUpdate'},
  }

  use {'nvim-telescope/telescope-file-browser.nvim'}
  use {'nvim-telescope/telescope-frecency.nvim'}

  -- mason
  use {'williamboman/mason.nvim'}

  -- lsp && autocompletion
  use {'neovim/nvim-lspconfig'}
  use {'hrsh7th/nvim-cmp'}
  use {'hrsh7th/cmp-nvim-lsp'}
  use {'hrsh7th/cmp-cmdline'}
  use {'hrsh7th/cmp-buffer'}
  use {'hrsh7th/cmp-path'}
  use {'williamboman/mason-lspconfig.nvim'}

  -- dap
  use {'mfussenegger/nvim-dap'}
  use {'jay-babu/mason-nvim-dap.nvim'}
  use {'rcarriga/nvim-dap-ui'}
  use {'theHamsta/nvim-dap-virtual-text'}
  use {'nvim-telescope/telescope-dap.nvim'}

  -- formatting
  use {'sbdchd/neoformat'}

  -- version control
  use {'f-person/git-blame.nvim'}
  use {'kdheepak/lazygit.nvim'}
  use {'mbbill/undotree'}

  -- file navigation
  use {'ThePrimeagen/harpoon'}
  use {'folke/trouble.nvim'}
  use {'preservim/tagbar'}

  -- cosmetic
  use {'nvim-lualine/lualine.nvim'}
  use {'arkav/lualine-lsp-progress'}
  use {'nvim-tree/nvim-web-devicons'}
  use {'goolord/alpha-nvim'}
  use {'ntpeters/vim-better-whitespace'}
  use {'xiyaowong/transparent.nvim'}
  use {'folke/noice.nvim'}
  -- themes
  use {"tiagovla/tokyodark.nvim", as = 'tokyodark'}
  use {'EdenEast/nightfox.nvim', as = 'nightfox'}
  use {'rose-pine/neovim', as = 'rose-pine' }
  use {"themercorp/themer.lua",}

  -- code editing help
  use {'kylechui/nvim-surround'}
  use {'KarimElghamry/vim-auto-comment'}
  use {'jackMort/ChatGPT.nvim'}

  -- language specific
  -- cpp
  use {'Civitasv/cmake-tools.nvim'}
  -- rust
  use {'rust-lang/rust-analyzer'}
  use {'rust-lang/rust.vim'}
  use {'simrat39/rust-tools.nvim'}
  -- use {'saecki/crates.nvim'}
  -- markdown
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })
  -- LaTeX
  use {'lervag/vimtex'} -- essential for LaTeX; Vimscript
  use {'kdheepak/cmp-latex-symbols'}
  use {'jbyuki/nabla.nvim'} -- show symbols in editor

  -- image preview
  -- use {'edluffy/hologram.nvim', rocks = {'magick'}}
  use {'3rd/image.nvim', rocks = {'magick'}}
  use {'m00qek/baleia.nvim'}
  use {'doctorfree/asciiart.nvim'}

  -- tmux
  use {'alexghergh/nvim-tmux-navigation'}
end)
