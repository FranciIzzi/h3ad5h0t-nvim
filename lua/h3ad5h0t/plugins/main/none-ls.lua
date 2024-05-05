return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			debug = true,
			sources = {
        null_ls.builtins.code_actions.refactoring,
        null_ls.builtins.formatting.biome,
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.shellharden,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.golines,
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.djlint,
				null_ls.builtins.formatting.htmlbeautifier,
			},
		})
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
