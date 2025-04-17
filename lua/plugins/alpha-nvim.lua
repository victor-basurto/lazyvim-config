return {
  {
    "goolord/alpha-nvim",
    dependencies = {
      -- "echasnovski/mini.icons",
      "nvim-tree/nvim-web-devicons",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local startify = require("alpha.themes.theta")
      -- available: devicons, mini, default is mini
      -- if provider not loaded and enabled is true, it will try to use another provider
      startify.file_icons.provider = "devicons"
      require("alpha").setup(startify.config)
    end,
  },
}
