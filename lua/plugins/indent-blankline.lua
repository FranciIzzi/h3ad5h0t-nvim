return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPost", "BufNewFile" },
  main = "ibl",
  -- should_load = function()
  --   local filetype = vim.bo.filetype
  --   return filetype ~= "dashboard"
  -- end,
  opts = {
    indent = {
      char = "▏",
    },
  },
}

