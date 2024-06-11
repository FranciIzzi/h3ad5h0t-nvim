function QuitNeovim()
	vim.cmd("wqa!")
end

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

function OpenZellijConfig()
	local current_dir = vim.fn.getcwd()
	local nvim_config_dir = vim.fn.expand("~/.config/zellij")

	if current_dir ~= nvim_config_dir then
		vim.cmd("cd " .. nvim_config_dir)
		vim.cmd("Neotree dir=" .. nvim_config_dir)
	else
		vim.cmd("Neotree dir=" .. nvim_config_dir)
	end
	vim.cmd("edit config.kdl")
end

return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
	config = function()
		local function custom_header()
			local datetime = os.date(" %d-%m-%Y - %H:%M:%S ")
			return {
				"",
				"",
				"",
				"",
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
			theme = "doom",
			config = {
				header = custom_header(),
				center = {
					{ desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
					{
						icon = " ",
						icon_hl = "@variable",
						desc = "Find Files",
						group = "Label",
						action = "Telescope find_files",
						key = "f",
					},
					{
						icon = " ",
						icon_hl = "@function",
						desc = "Zellij Config",
						group = "Function",
						action = "lua OpenZellijConfig()",
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
					{
						icon = "󰍃 ",
						icon_hl = "Exit",
						desc = "Quit Neovim",
						group = "Function",
						key = "q",
						action = "lua QuitNeovim()",
					},
				},
				footer = {
					"",
					"",
					"Develeped by Francesco Izzi.",
					"I'm Arch btw :)",
				},
			},
		})
	end,
}
