return {
	"ziontee113/color-picker.nvim",
	lazy = true,
	config = function()
		local opts = { noremap = true, silent = true }

		vim.keymap.set("n", "<leader>cp", "<cmd>PickColor<cr>", opts)
		vim.keymap.set("i", "<leader>cp", "<cmd>PickColorInsert<cr>", opts)

		require("color-picker").setup({
			["icons"] = { "", "ﰕ" },
			["border"] = "rounded",
			["keymap"] = {
				["U"] = "<Plug>ColorPickerSlider5Decrease",
				["O"] = "<Plug>ColorPickerSlider5Increase",
			},
			["background_highlight_group"] = "Normal",
			["border_highlight_group"] = "FloatBorder",
			["text_highlight_group"] = "Normal",
		})
	end,
}
