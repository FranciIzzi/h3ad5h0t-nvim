return {
	"numToStr/Comment.nvim",
  lazy = {
    event = {'VimEnter'},
  },
	opts = {},
	config = function()
		require("Comment").setup()
	end,
}
