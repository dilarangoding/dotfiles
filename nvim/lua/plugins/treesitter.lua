return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local config = require("nvim-treesitter.config")
      config.setup({
        auto_install = true,
        ensure_installed = {
          "bash",
          "php",
          "html",
          "css",
          "scss",
          "javascript",
          "typescript",
          "json",
          "lua",
          "go",
        },
        highlight = { enable = true },
        indent = { enable = false },
      })
    end
  }
}
