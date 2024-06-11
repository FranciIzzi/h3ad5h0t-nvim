return {
	"akinsho/bufferline.nvim",
	requires = "kyazdani42/nvim-web-devicons",
	config = function()
		require("bufferline").setup({
			options = {
				offsets = {
					{ filetype = "NvimTree", text = "Explorer", highlight = "Directory", text_align = "left" },
				},
				show_buffer_close_icons = true,
				show_close_icon = false,
				show_tab_indicators = true,
				separator_style = "thin",
				enforce_regular_tabs = false,
				always_show_bufferline = true,
				diagnostics = "nvim_lsp",
				diagnostics_indicator = function(count)
					return "(" .. count .. ")"
				end,
			},
		})
	end,
}
