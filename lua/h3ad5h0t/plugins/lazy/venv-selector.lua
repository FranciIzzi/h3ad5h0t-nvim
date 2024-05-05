return {
	"linux-cultist/venv-selector.nvim",
	lazy = {
		commands = { "VenvSelect",},
	},
	dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
	config = function()
		require("venv-selector").setup({
			pyenv_path = "/home/h3ad5h0t/Desktop/Back-End/ENVS",
		})
	end,
	keys = {
		{ "<leader>vs", "<cmd>VenvSelect<cr>" },
		{ "<leader>vc", "<cmd>VenvSelectCurrent<cr>" },
	},
	cmd = "VenvSelect",
}
