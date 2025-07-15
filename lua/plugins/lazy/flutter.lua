return {
	-- {
	-- 	"mfussenegger/nvim-dap",
	-- 	dependencies = {
	-- 		"nvim-neotest/nvim-nio",
	-- 		"rcarriga/nvim-dap-ui",
	-- 	},
	-- 	event = "VeryLazy",
	-- 	config = function()
	-- 		require("dapui").setup({
	-- 			icons = { expanded = "▾", collapsed = "▸" },
	-- 			layouts = {
	-- 				{
	-- 					elements = {
	-- 						{ id = "scopes", size = 0.25 },
	-- 						"breakpoints",
	-- 						"stacks",
	-- 						"watches",
	-- 					},
	-- 					size = 10,
	-- 					position = "bottom",
	-- 				},
	-- 			},
	-- 		})
	-- 	end,
	-- },
	{
		"nvim-flutter/flutter-tools.nvim",
		lazy = true,
		ft = "dart",
		cmd = { "FlutterRun", "FlutterHotReload", "FlutterHotRestart", "FlutterQuit" },
		dependencies = {
			"nvim-lua/plenary.nvim",
			"stevearc/dressing.nvim",
		},
		config = true,
		-- config = function()
		-- require("flutter-tools").setup({
		-- 	debugger = {
		-- 		enabled = true,
		-- 		run_via_dap = true,
		-- 		exception_breakpoints = {},
		-- 		register_configurations = function(paths)
		-- 			local dap = require("dap")
		-- 			dap.adapters.dart = {
		-- 				type = "executable",
		-- 				command = paths.flutter_bin,
		-- 				args = { "debug-adapter" },
		-- 			}
		-- 			dap.configurations.dart = {}
		-- 			require("dap.ext.vscode").load_launchjs()
		-- 		end,
		-- 	},
		-- })
		-- end,
	},
}
