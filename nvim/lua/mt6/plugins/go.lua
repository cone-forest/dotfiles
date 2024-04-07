return {
  {
    "ray-x/go.nvim",
    dependencies = {
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    ft = { 'go', 'gomod' },
    event = { 'CmdlineEnter' },
    build = ':lua require("go.install").update_all_sync()',
    opts = {},
  },
}
