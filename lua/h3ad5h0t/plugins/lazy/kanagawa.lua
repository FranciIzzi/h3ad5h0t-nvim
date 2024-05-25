return {
	"rebelot/kanagawa.nvim",
	lazy = true,
	name = "kanagawa",
	config = function()
		require("kanagawa").setup({})
		vim.cmd.colorscheme("kanagawa-dragon")
	end,
}
