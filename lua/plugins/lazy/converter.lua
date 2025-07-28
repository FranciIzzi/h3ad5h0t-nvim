return {
	"cjodo/convert.nvim",
	lazy = true,
	-- cmd = { "Convert" },
	event = "VeryLazy",
	ft = { "css", "scss", "html" },
	config = function()
		require("convert").setup()
	end,
}
