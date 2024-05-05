return {
	"chrisgrieser/nvim-scissors",
	lazy = true,
	dependencies = "nvim-telescope/telescope.nvim",
	config = function()
		require("scissors").setup({
			snippetDir = "~/.config/nvim/lua/snippets",
			editSnippetPopup = {
				height = 0.4,
				width = 0.6,
				border = "rounded",
				keymaps = {
					cancel = "q",
					saveChanges = "s",
					goBackToSearch = "<BS>",
					deleteSnippet = "<C-BS>",
					duplicateSnippet = "<C-d>",
					openInFile = "<C-o>",
					insertNextToken = "<C-t>",
					jumpBetweenBodyAndPrefix = "<C-Tab>",
				},
			},
			telescope = {
				alsoSearchSnippetBody = false,
			},
			jsonFormatter = "none",
		})
	end,
}
