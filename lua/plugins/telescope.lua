-- Telescope --
return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local kmap = vim.keymap
      local builtin = require("telescope.builtin")
      -- some KeyBindings for Telescope
      kmap.set("n", "<C-p>", builtin.find_files, {})
      kmap.set("n", "<leader>fg", builtin.live_grep, {})
      kmap.set("n", "<leader>fb", builtin.buffers, {})
      kmap.set("n", "<leader>of", builtin.oldfiles, {})
      kmap.set("n", "<leader>ch", builtin.command_history, {})
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({
              -- even more opts
            }),
          },
        },
      })
      require("telescope").load_extension("ui-select")
    end,
  },
}
