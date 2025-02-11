return {
  {
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = {
					icons_enabled = true,
					theme = {
						normal = {
							a = { fg = "#ffffff", bg = "#5c6370", gui = "bold" },
							b = { fg = "#ffffff", bg = "#3e4452" },
							c = { fg = "#dcdfe4", bg = "#2c323c" },
						},
						insert = {
							a = { fg = "#ffffff", bg = "#3a9d23", gui = "bold" },
							b = { fg = "#ffffff", bg = "#3e4452" },
							c = { fg = "#dcdfe4", bg = "#2c323c" },
						},
						visual = {
							a = { fg = "#ffffff", bg = "#d19a66", gui = "bold" },
							b = { fg = "#ffffff", bg = "#3e4452" },
							c = { fg = "#dcdfe4", bg = "#2c323c" },
						},
						replace = {
							a = { fg = "#ffffff", bg = "#e06c75", gui = "bold" },
							b = { fg = "#ffffff", bg = "#3e4452" },
							c = { fg = "#dcdfe4", bg = "#2c323c" },
						},
						command = {
							a = { fg = "#ffffff", bg = "#61afef", gui = "bold" },
							b = { fg = "#ffffff", bg = "#3e4452" },
							c = { fg = "#dcdfe4", bg = "#2c323c" },
						},
						inactive = {
							a = { fg = "#dcdfe4", bg = "#2c323c", gui = "bold" },
							b = { fg = "#dcdfe4", bg = "#2c323c" },
							c = { fg = "#dcdfe4", bg = "#2c323c" },
						},
					},
					component_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },
					disabled_filetypes = {
						statusline = {},
						winbar = {},
					},
					ignore_focus = {},
					always_divide_middle = true,
					always_show_tabline = true,
					globalstatus = false,
					refresh = {
						statusline = 100,
						tabline = 100,
						winbar = 100,
					},
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch", "diff", "diagnostics" },
					lualine_c = { { "filename", path = 1 } },
					lualine_x = { "encoding", "fileformat", "filetype" },
					lualine_y = { "progress" },
					lualine_z = { "location" },
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = { { "filename", path = 1 } },
					lualine_x = { "location" },
					lualine_y = {},
					lualine_z = {},
				},
				tabline = {},
				inactive_winbar = {},
				extensions = {},
			})
		end,
	},
	{
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
	},
}
