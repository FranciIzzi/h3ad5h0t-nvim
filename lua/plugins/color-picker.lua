return {
  {
    "ziontee113/color-picker.nvim",
    lazy = {
      commands = { "LoadColorPicker" },
      ft = { "dart", "css", "html", "javascript", "typescript" },
    },
    config = function()
      local opts = { noremap = true, silent = true }

      vim.keymap.set("n", "<leader>cp", "<cmd>PickColor<cr>", opts)
      vim.keymap.set("i", "<leader>cp", "<cmd>PickColorInsert<cr>", opts)

      require("color-picker").setup({
        ["icons"] = { "", "ﰕ" },
        ["border"] = "rounded", -- none | single | double | rounded | solid | shadow
        ["keymap"] = {
          ["U"] = "<Plug>ColorPickerSlider5Decrease",
          ["O"] = "<Plug>ColorPickerSlider5Increase",
        },
        ["background_highlight_group"] = "Normal",
        ["border_highlight_group"] = "FloatBorder",
        ["text_highlight_group"] = "Normal",
      })
    end,
    cmd = "LoadColorPicker",
  },
  {
    "norcalli/nvim-colorizer.lua",
    lazy = {
      commands = { "LoadColorizer" },
      ft = { "dart", "css", "html", "javascript", "typescript" },
    },
    config = function()
      require("colorizer").setup({
        "*",
      }, {
        RGB = true,
        RRGGBB = true,
        names = true,
        RRGGBBAA = true,
        rgb_fn = true,
        hsl_fn = true,
        css = true,
        css_fn = true,
        mode = "background",
      })
    end,
    cmd = "LoadColorizer",
  },
}
