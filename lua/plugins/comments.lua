return {
	"numToStr/Comment.nvim",
	event = "VimEnter",
	opts = {},
	config = function()
		require("Comment").setup()
	end,
}
