-- ColorTheme
return {
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    priority = 999,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("kanagawa").setup({
        theme = "dragon",
      })
      vim.cmd.colorscheme("kanagawa")
    end,
  }
}
