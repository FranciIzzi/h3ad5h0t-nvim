return {
	{
		"rcarriga/nvim-dap-ui",
		lazy = {
			commands = { "LoadDebug" },
		},
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
			"leoluz/nvim-dap-go",
			"mxsdev/nvim-dap-vscode-js",
			{
				"microsoft/vscode-js-debug",
				version = "1.x",
				build = "npm i && npm run compile vsDebugServerBundle && mv dist out",
			},
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			require("dap-vscode-js").setup({
				debugger_path = "/home/h3ad5h0t/.local/share/nvim/lazy/vscode-js-debug",
				adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
			})

			for _, language in ipairs({ "typescript", "javascript", "svelte" }) do
				dap.configurations[language] = {

					{
						type = "pwa-node",
						request = "attach",
						processId = require("dap.utils").pick_process,
						name = "Attach debugger to existing `node` process",
						sourceMaps = true,
						resolveSourceMapLocations = {
							"${workspaceFolder}/**",
							"!**/node_modules/**",
						},
						cwd = "${workspaceFolder}/src",
						skipFiles = { "${workspaceFolder}/node_modules/**/*.js" },
					},
					{
						type = "pwa-chrome",
						name = "Launch Chrome to debug client",
						request = "launch",
						url = "http://localhost:3000",
						sourceMaps = true,
						protocol = "inspector",
						port = 3000,
						webRoot = "${workspaceFolder}/src",
						skipFiles = { "**/node_modules/**/*", "**/@vite/*", "**/src/client/*", "**/src/*" },
					},
					language == "javascript" and {
						type = "pwa-node",
						request = "launch",
						name = "Launch file in new node process",
						program = "${file}",
						cwd = "${workspaceFolder}",
					} or nil,
				}
			end

			dap.adapters.dart = {
				type = "executable",
				command = "dart",
				args = { "debug_adapter" },
			}
			dap.adapters.flutter = {
				type = "executable",
				command = "flutter",
				args = { "debug_adapter" },
			}
			dap.configurations.dart = {
				{
					type = "dart",
					request = "launch",
					name = "Launch dart",
					dartSdkPath = "/home/h3ad5h0t/flutter/bin/dart",
					flutterSdkPath = "/home/h3ad5h0t/flutter/bin/flutter",
					program = "${workspaceFolder}/lib/main.dart",
					cwd = "${workspaceFolder}",
				},
				{
					type = "flutter",
					request = "launch",
					name = "Launch flutter",
					dartSdkPath = "/home/h3ad5h0t/flutter/bin/dart",
					flutterSdkPath = "/home/h3ad5h0t/flutter/bin/flutter",
					program = "${workspaceFolder}/lib/main.dart",
					cwd = "${workspaceFolder}",
				},
			}

			dap.configurations.python = {
				{
					name = "Django runserver",
					type = "python",
					request = "launch",
					program = "${workspaceFolder}/manage.py",
					args = { "runserver", "0.0.0.0:8000" },
					pythonPath = function()
						return "/home/h3ad5h0t/Desktop/DeDPartners/Back-End/.my_ENVS/censhub/bin/python"
					end,
					justMyCode = false,
				},
			}
			require("dapui").setup()
			require("dap-go").setup()
			dap.set_log_level("DEBUG")
			dap.listeners.after.event_initialized.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end
			vim.keymap.set("n", "<leader>dc", dap.continue, {})
			vim.keymap.set("n", "<leader>do", dap.step_over, {})
			vim.keymap.set("n", "<leader>di", dap.step_into, {})
			vim.keymap.set("n", "<leader>db", dap.step_out, {})
			vim.keymap.set("n", "<leader> :db", dap.toggle_breakpoint, {})
			vim.keymap.set("n", "<leader>dr", dap.repl.open, {})
		end,
		cmd = "LoadDebug",
	},
	{
		"mfussenegger/nvim-dap-python",
		lazy = {
			commands = { "LoadDebug" },
		},
		dependencies = {
			"mfussenegger/nvim-dap",
			"rcarriga/nvim-dap-ui",
		},
		config = function()
			local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
			require("dap-python").setup(path)
		end,
		cmd = "LoadDebug",
	},
}
