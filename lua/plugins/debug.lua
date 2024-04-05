return {
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio", "leoluz/nvim-dap-go" },
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

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
					name = "Django",
					-- Tipo di debugger, deve essere `python`
					type = "python",
					-- Comando di richiesta, `launch` per avviare il debug
					request = "launch",
					-- Programma da eseguire (il tuo manage.py di Django)
					program = "${workspaceFolder}/manage.py",
					-- Argomenti passati al programma; in questo caso, avviamo il server Django
					args = { "runserver", "--noreload" },
					-- Assicurati che Django usi l'interprete Python corretto, modificare il percorso secondo necessità
					pythonPath = function()
						return "/home/h3ad5h0t/Desktop/Back-End/ENVS/censhub/bin/python"
					end,
					-- Imposta questo a true per consentire di debuggare i template di Django
					justMyCode = false,
				},
			}

			require("dapui").setup()
			require("dap-go").setup()

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
