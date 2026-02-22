return {
  "OXY2DEV/markview.nvim",
  lazy = false,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    preview = {
      filetypes = { "markdown", "quarto" },
      ignore_buftypes = {},
    },
  }
}
