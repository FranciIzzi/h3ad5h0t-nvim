-- Dashboard

function OpenNvimConfig()
	local current_dir = vim.fn.getcwd()
	local nvim_config_dir = vim.fn.expand("~/.config/nvim")

	if current_dir ~= nvim_config_dir then
		vim.cmd("cd " .. nvim_config_dir)
		vim.cmd("Neotree dir=" .. nvim_config_dir)
	else
		vim.cmd("Neotree dir=" .. nvim_config_dir)
	end
	vim.cmd("edit init.lua")
end

function CreateNewFile()
	local newFileName = vim.fn.input("Nome File: ")
	if newFileName == "" then
		return
	end

	vim.cmd("edit " .. newFileName)
	vim.cmd("autocmd BufWritePre <buffer> lua SaveNewFileAs()")
end

function SaveNewFileAs()
	local path = vim.fn.input("Salva in: ", vim.fn.getcwd() .. "/", "file")
	vim.cmd("silent! saveas " .. path)
	vim.cmd("autocmd! BufWritePre <buffer>")
end

return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	config = function()
		local function custom_header()
			local datetime = os.date(" %d-%m-%Y - %H:%M:%S ")
			return {
				"",
				" ██╗  ██╗    ██████╗      █████╗     ██████╗     ███████╗    ██╗  ██╗     ██████╗     ████████╗ ",
				" ██║  ██║    ╚════██╗    ██╔══██╗    ██╔══██╗    ██╔════╝    ██║  ██║    ██╔═████╗    ╚══██╔══╝ ",
				" ███████║     █████╔╝    ███████║    ██║  ██║    ███████╗    ███████║    ██║██╔██║       ██║    ",
				" ██╔══██║     ╚═══██╗    ██╔══██║    ██║  ██║    ╚════██║    ██╔══██║    ████╔╝██║       ██║    ",
				" ██║  ██║    ██████╔╝    ██║  ██║    ██████╔╝    ███████║    ██║  ██║    ╚██████╔╝       ██║    ",
				" ╚═╝  ╚═╝    ╚═════╝     ╚═╝  ╚═╝    ╚═════╝     ╚══════╝    ╚═╝  ╚═╝     ╚═════╝        ╚═╝    ",
				"",
				datetime,
				"",
			}
		end
		require("dashboard").setup({
			theme = "hyper",
			config = {
				header = custom_header(),
				shortcut = {
					{ desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
					{
						icon = " ",
						icon_hl = "@variable",
						desc = "Find Files",
						group = "Label",
						action = "Telescope find_files",
						key = "f",
					},
					{
            icon= " ",
						desc = "New file",
						group = "Function",
						action = "lua CreateNewFile()",
						key = "a",
					},
					{
						icon = " ",
						icon_hl = "@function",
						desc = "Neovim Configs",
						group = "Function",
						action = "lua OpenNvimConfig()",
						key = "n",
					},
				},
			},
		})
	end,
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
