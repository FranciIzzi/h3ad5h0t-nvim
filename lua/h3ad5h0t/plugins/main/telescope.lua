return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local kmap = vim.keymap
      local builtin = require("telescope.builtin")
      kmap.set("n", "<leader>ff", builtin.find_files, {})
      kmap.set("n", "<leader>fg", builtin.live_grep, {})
      kmap.set("n", "<leader>fw", builtin.grep_string, {})
      kmap.set("n", "<leader>fb", builtin.buffers, {})
      kmap.set("n", "<leader>of", builtin.oldfiles, {})
      kmap.set("n", "<leader>ch", builtin.command_history, {})
      kmap.set("n", "<leader>ks", builtin.keymaps, {})
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        defaults = {
          mappings = {},
        }, extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      require("telescope").load_extension("ui-select")
    end,
  },
}
