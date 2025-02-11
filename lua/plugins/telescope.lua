	return {
    {
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		event = "VeryLazy",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local myKmap = vim.keymap
			local builtin = require("telescope.builtin")
			myKmap.set("n", "<leader>ff", builtin.find_files, {desc = "Telescope find file" })
			myKmap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
			myKmap.set("n", "<leader>fw", builtin.grep_string, {})
			myKmap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
			myKmap.set("n", "<leader>of", builtin.oldfiles, {})
			myKmap.set("n", "<leader>ch", builtin.command_history, {})
			myKmap.set("n", "<leader>ks", builtin.keymaps, {})
			myKmap.set("n", "<leader>fk", builtin.commands, { desc = "Telescope commands" })
			myKmap.set("n", "<leader>gf", builtin.git_files, {})
			myKmap.set("n", "<leader>h", builtin.help_tags, {})
		end,
	},
}

