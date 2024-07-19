return {
	"catppuccin/nvim",
  lazy = false,
	name = "catppuccin",
	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = {
            enabled = true,
            indentscope_color = "",
        },
    }
		})
		vim.cmd.colorscheme("catppuccin-mocha")
	end,
}
