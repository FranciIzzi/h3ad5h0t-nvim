-- ColorTheme
return {
	{
		"catppuccin/nvim",
		lazy = {
			commands = { "LoadCatppuccin" },
		},
		name = "catppuccin",
		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
			})
			vim.cmd.colorscheme("catppuccin")
		end,
    cmd = "LoadCatppuccin",
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
	},
}
