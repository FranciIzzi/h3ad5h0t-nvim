-- Git setup
return {
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",

			"nvim-telescope/telescope.nvim", -- optional
		},
		config = true,
	},
  {'akinsho/git-conflict.nvim', version = "*", config = true},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
      vim.keymap.set("n","<leader>gp",":Gitsigns preview_hunk<CR>", {})
      -- vim.keymap.set("n","<leader>gt", ":Gitsign toggle_current_line_blame<CR>", {})
		end,
	},
}
