return {
	{
		"vhyrro/luarocks.nvim",
		priority = 1000,
		config = true,
	},
	{
		"rest-nvim/rest.nvim",
		ft = "http",
		dependencies = { "luarocks.nvim" },
		config = function()
			require("telescope").load_extension("rest")
			require("telescope").extensions.rest.select_env()
			require("rest-nvim").setup()
		end,
	},
}
