-- Git setup
return {
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = true,
  },
  {
    "akinsho/git-conflict.nvim",
    version = "*",
    config = function()
            vim.keymap.set("n", "<leader>sc", ":GitConflictListQf<CR>", {})

      require("git-conflict").setup({
        disable_diagnostics = false,
        highlights = {
          incoming = "DiffText",
          current = "DiffAdd",
        },
        default_mappings = {
          ours = "o",
          theirs = "t",
          none = "0",
          both = "b",
          next = "n",
          prev = "p",
        },
      })
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = "LazyGit",
  },
  {
    "tpope/vim-fugitive",
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
      vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
    end,
  },
}
