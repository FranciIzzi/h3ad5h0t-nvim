return {
	"nvim-flutter/flutter-tools.nvim",
	lazy = true,
	ft = "dart",
	cmd = { "FlutterRun", "FlutterHotReload", "FlutterHotRestart", "FlutterQuit" },
	dependencies = {
		"nvim-lua/plenary.nvim",
		"stevearc/dressing.nvim",
	},
	config = function()
		local flutter_tools = require("flutter-tools")
		vim.keymap.set("n", "<leader>lt", ":FlutterLogToggle<CR>", { silent = true })
		vim.keymap.set("n", "<leader>lc", ":FlutterLogClear<CR>", { silent = true })
		vim.keymap.set("n", "<leader>hr", ":FlutterRestart<CR>", { silent = true })
		vim.keymap.set("n", "<leader>fd", ":FlutterDevices<CR>", { silent = true })
		vim.keymap.set("n", "<leader>fq", ":FlutterQuit<CR>", { silent = true })
		flutter_tools.setup({
			debugger = {
				enabled = true,
				run_via_dap = true,
				register_configurations = function(_)
					require("dap").configurations.dart = {
						{
							type = "dart",
							request = "launch",
							name = "Launch Flutter App",
							dartSdkPath = "/home/h3ad5h0t/development/flutter/bin/cache/dart-sdk",
							flutterSdkPath = "/home/h3ad5h0t/development/flutter",
							program = "${workspaceFolder}/lib/main.dart",
							cwd = "${workspaceFolder}",
						},
					}
				end,
			},
			widget_guides = {
				enabled = true,
			},
		})
	end,
}
