return {
	"akinsho/toggleterm.nvim",
	lazy = {
		commands = {
			"ToggleTerm",
			"ToggleTermToggleAll",
			"ToggleTermSendCurrentLine",
			"ToggleTermSendVisualLines",
		},
	},
	version = "*",
	config = function()
		require("toggleterm").setup({
			size = 17,
			open_mapping = [[<leader>t]],
			hide_numbers = true,
			shade_filetypes = {},
			autochdir = true,
			shade_terminals = true,
			start_in_insert = true,
			insert_mappings = true,
			terminal_mappings = true,
			persist_size = true,
			persist_mode = true,
			direction = "horizontal",
			close_on_exit = true,
			shell = vim.o.shell,
			auto_scroll = true,
			float_opts = {},
			winbar = {
				enabled = false,
				name_formatter = function(term)
					return term.name
				end,
			},
		})
	end,
}
