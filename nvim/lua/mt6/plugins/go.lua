return {
  {
    "ray-x/go.nvim",
    dependencies = {  -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    ft = {"go", 'gomod'},
    keys = {
      {'<leader>b', '<cmd> GoBuild <cr>'},
      {'<leader>B', '<cmd> GoBuild <cr>'},
      {'<leader>R', '<cmd> GoRun <cr>'},
      {'<leader>T', '<cmd> GoTest <cr>'},
    },
    event = {"CmdlineEnter"},
    build = ':lua require("go.install").update_all_sync()',
    opts = {},
  },
}
