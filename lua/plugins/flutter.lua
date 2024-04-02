return {
	"akinsho/flutter-tools.nvim",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"stevearc/dressing.nvim", -- optional for vim.ui.select
	},
	config = function()
		require("flutter-tools").setup({
      debugger = {
    enabled = true
,
    run_via_dap = true,
   },
			flutter_path = "/home/h3ad5h0t/Desktop/flutter/bin" ,
			flutter_lookup_cmd = nil,
		})
	end,
}
