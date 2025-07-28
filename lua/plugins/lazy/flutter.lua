return {
	"nvim-flutter/flutter-tools.nvim",
	lazy = true,
	ft = "dart",
	cmd = { "FlutterRun", "FlutterHotReload", "FlutterHotRestart", "FlutterQuit" },
	dependencies = {
		"nvim-lua/plenary.nvim",
		"stevearc/dressing.nvim",
	},
	config = true,
}
