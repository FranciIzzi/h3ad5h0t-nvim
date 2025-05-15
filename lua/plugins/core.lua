return {
	---@diagnostic disable: undefined-global
	{
		"kevinhwang91/nvim-ufo",
		event = "BufReadPost",
		dependencies = "kevinhwang91/promise-async",
		config = function()
			vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
			vim.o.foldcolumn = "1"
			vim.o.foldlevel = 99
			vim.o.foldlevelstart = 99
			vim.o.foldenable = true

			vim.keymap.set("n", "zR", require("ufo").openAllFolds)
			vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
			vim.keymap.set("n", "zK", function()
				local winid = require("ufo").peekFoldedLinesUnderCursor()
				if not winid then
					vim.lsp.buf.hover()
				end
			end, { desc = "Peek Fold" })
			require("ufo").setup({
				---@diagnostic disable-next-line: unused-local
				provider_selector = function(bufnr, filetype, buftype)
					return { "lsp", "indent" }
				end,
			})
		end,
	},
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				surrounds = {
					["q"] = { add = { '"', '"' } }, -- aggiunge `q` come shortcut per `"`
					["Q"] = { add = { "[", "]" } }, -- aggiunge `q` come shortcut per `"`
					["b"] = { add = { "(", ")" } }, -- Aggiunge `b` per `()`
					["B"] = { add = { "{", "}" } }, -- Aggiunge `B` per `{}`
					["r"] = { add = { "<", ">" } },
					["c"] = { add = { "/*", "*/" } },
					["C"] = { -- Surround con tag HTML
						add = function()
							local left = vim.fn.input("Enter left part: ")
							local right = vim.fn.input("Enter right part: ")
							return { left, right }
						end,
					},
					["t"] = { -- Surround con tag HTML
						add = function()
							local tag = vim.fn.input("Tag: ")
							return { "<" .. tag .. ">", "</" .. tag .. ">" }
						end,
					},
				},
			})
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({
				disable_filetype = { "TelescopePrompt", "spectre_panel" },
				disable_in_macro = true,
				disable_in_visualblock = false,
				disable_in_replace_mode = true,
				ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=],
				enable_moveright = true,
				enable_afterquote = true,
				enable_check_bracket_line = true,
				enable_bracket_in_quote = true,
				enable_abbr = false,
				break_undo = true,
				check_ts = false,
				fast_wrap = {
					map = "<M-e>",
					chars = { "{", "[", "(", '"', "'", "`", "<" },
					pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
					end_key = "$",
					keys = "qwertyuiopzxcvbnmasdfghjkl",
					check_comma = true,
					highlight = "PmenuSel",
					highlight_grey = "LineNr",
				},
				map_cr = true,
				map_bs = true,
				map_c_h = false,
				map_c_w = false,
			})
		end,
	},
	{
		"jiaoshijie/undotree",
		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			require("undotree").setup({
				float_diff = true,
				layout = "left_bottom",
				position = "left",
				ignore_filetype = {
					"undotree",
					"undotreeDiff",
					"qf",
					"TelescopePrompt",
					"spectre_panel",
					"tsplayground",
				},
				window = {
					winblend = 30,
				},
				keymaps = {
					["j"] = "move_next",
					["k"] = "move_prev",
					["gj"] = "move2parent",
					["J"] = "move_change_next",
					["K"] = "move_change_prev",
					["<cr>"] = "action_enter",
					["p"] = "enter_diffbuf",
					["q"] = "quit",
				},
			})
		end,
		keys = {
			{ "<leader>u", "<cmd>lua require('undotree').toggle()<cr>" },
		},
	},
}
