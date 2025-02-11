return	{
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
						ours = "co",
						theirs = "ct",
						none = "c0",
						both = "cb",
						next = "gn",
						prev = "gp",
					},
				})
			end,
		},
		{
			"lewis6991/gitsigns.nvim",
			config = function()
				require("gitsigns").setup()
				vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
			end,
		},
}

