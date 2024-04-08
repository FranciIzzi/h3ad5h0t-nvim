return {
	{
		"rcarriga/nvim-dap-ui",
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
					-- attach to a node process that has been started with
					-- `--inspect` for longrunning tasks or `--inspect-brk` for short tasks
					-- npm script -> `node --inspect-brk ./node_modules/.bin/vite dev`
					{
						-- use nvim-dap-vscode-js's pwa-node debug adapter
						type = "pwa-node",
						-- attach to an already running node process with --inspect flag
						-- default port: 9222
						request = "attach",
						-- allows us to pick the process using a picker
						processId = require("dap.utils").pick_process,
						-- name of the debug action you have to select for this config
						name = "Attach debugger to existing `node --inspect` process",
						-- for compiled languages like TypeScript or Svelte.js
						sourceMaps = true,
						-- resolve source maps in nested locations while ignoring node_modules
						resolveSourceMapLocations = {
							"${workspaceFolder}/**",
							"!**/node_modules/**",
						},
						-- path to src in vite based projects (and most other projects as well)
						cwd = "${workspaceFolder}/src",
						-- we don't want to debug code inside node_modules, so skip it!
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
						-- skip files from vite's hmr
						skipFiles = { "**/node_modules/**/*", "**/@vite/*", "**/src/client/*", "**/src/*" },
					},
					-- only if language is javascript, offer this debug action
					language == "javascript"
							and {
								-- use nvim-dap-vscode-js's pwa-node debug adapter
								type = "pwa-node",
								-- launch a new process to attach the debugger to
								request = "launch",
								-- name of the debug action you have to select for this config
								name = "Launch file in new node process",
								-- launch current file
								program = "${file}",
								cwd = "${workspaceFolder}",
							}
						or nil,
				}
			end

			-- Dart / Flutter
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
					dartSdkPath = "/home/h3ad5h0t/Desktop/flutter/bin/dart", -- ensure this is correct
					flutterSdkPath = "/home/h3ad5h0t/Desktop/flutter/bin/flutter", -- ensure this is correct
					program = "${workspaceFolder}/lib/main.dart", -- ensure this is correct
					cwd = "${workspaceFolder}",
				},
				{
					type = "flutter",
					request = "launch",
					name = "Launch flutter",
					dartSdkPath = "/home/h3ad5h0t/Desktop/flutter/bin/dart", -- ensure this is correct
					flutterSdkPath = "/home/h3ad5h0t/Desktop/flutter/bin/flutter", -- ensure this is correct
					program = "${workspaceFolder}/lib/main.dart", -- ensure this is correct
					cwd = "${workspaceFolder}",
				},
			}

			dap.configurations.python = {
				{
					-- Nome della configurazione
					name = "Django runserver",
					-- Tipo di debugger, deve essere `python`
					type = "python",
					-- Comando di richiesta, `launch` per avviare il debug
					request = "launch",
					-- Programma da eseguire (il tuo manage.py di Django)
					program = "${workspaceFolder}/manage.py",
					-- Argomenti passati al programma; in questo caso, avviamo il server Django
					args = { "runserver", "0.0.0.0:8000" }, -- Assicurati che Django usi l'interprete Python corretto, modificare il percorso secondo necessità
					pythonPath = function()
						return "/home/h3ad5h0t/Desktop/Back-End/ENVS/censhub/bin/python"
					end,
					-- Imposta questo a true per consentire di debuggare i template di Django
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
			vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, {})
			vim.keymap.set("n", "<leader>dr", dap.repl.open, {})
		end,
	},
	{
		"mfussenegger/nvim-dap-python",
		dependencies = {
			"mfussenegger/nvim-dap",
			"rcarriga/nvim-dap-ui",
		},
		config = function()
			local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
			require("dap-python").setup(path)
		end,
	},
}
