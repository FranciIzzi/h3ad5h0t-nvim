return {
  {
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			position = "bottom",
			height = 20,
			icons = true,
			mode = "workspace_diagnostics",
			severity = nil,
			fold_open = "",
			fold_closed = "",
			group = true,
			padding = true,
			cycle_results = true,
			action_keys = {
				close = "q",
				cancel = "<esc>",
				refresh = "r",
				jump = { "<cr>", "<tab>", "<2-leftmouse>" },
				open_split = { "<c-x>" },
				open_vsplit = { "<c-v>" },
				open_tab = { "<c-t>" },
				jump_close = { "o" },
				toggle_mode = "m",
				switch_severity = "s",
				toggle_preview = "P",
				hover = "K",
				preview = "p",
				open_code_href = "c",
				close_folds = { "zM", "zm" },
				open_folds = { "zR", "zr" },
				toggle_fold = { "zA", "za" },
				previous = "k",
				next = "j",
				help = "?",
			},
			multiline = true,
			indent_lines = true,
			win_config = { border = "single" },
			auto_open = false,
			auto_close = false,
			auto_preview = true,
			auto_fold = false,
			auto_jump = { "lsp_definitions" },
			include_declaration = { "lsp_references", "lsp_implementations", "lsp_definitions" },
			signs = {
				error = "",
				warning = "",
				hint = "",
				information = "",
				other = "",
			},
			use_diagnostic_signs = false,
		},
		config = function()
			require("trouble").setup({
				icons = false,
			})
			vim.keymap.set("n", "<leader>tt", function()
				require("trouble").toggle()
			end)

			vim.keymap.set("n", "[t", function()
				require("trouble").next({ skip_groups = true, jump = true })
			end)

			vim.keymap.set("n", "]t", function()
				require("trouble").previous({ skip_groups = true, jump = true })
			end)
		end,
	},
}
