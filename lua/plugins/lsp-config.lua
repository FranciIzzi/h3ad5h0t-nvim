return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- Setup language servers.
			local kmap = vim.keymap
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.pyright.setup({
				capabilities = capabilities,
			})
			lspconfig.bashls.setup({
				capabilities = capabilities,
			})
			lspconfig.gopls.setup({
				capabilities = capabilities,
			})
			lspconfig.html.setup({
				capabilities = capabilities,
			})
			lspconfig.jsonls.setup({
				capabilities = capabilities,
			})
			lspconfig.pylsp.setup({
				capabilities = capabilities,
			})
			lspconfig.ruff_lsp.setup({
				capabilities = capabilities,
			})
			lspconfig.sourcery.setup({
				capabilities = capabilities,
			})
			lspconfig.pylyzer.setup({
				capabilities = capabilities,
			})
			lspconfig.pyre.setup({
				capabilities = capabilities,
			})
			lspconfig.basedpyright.setup({
				capabilities = capabilities,
			})
			kmap.set("n", "K", vim.lsp.buf.hover, {})
			kmap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			kmap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			kmap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
