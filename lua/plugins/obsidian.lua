if true then
  return {}
end
return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = { "markdown" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "hrsh7th/nvim-cmp",
    "nvim-treesitter/nvim-treesitter",
    "preservim/vim-markdown",
  },
  opts = {},
}
