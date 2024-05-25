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
        local kmap = vim.keymap
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			lspconfig.dartls.setup({
				cmd = { "dart", "language-server", "--protocol=lsp" },
			})
      lspconfig.svelte.setup({
        capabilities = capabilities,
      })
			lspconfig.bashls.setup({
				capabilities = capabilities,
			})
			lspconfig.spectral.setup({
				capabilities = capabilities,
			})

			lspconfig.vimls.setup({
				capabilities = capabilities,
			})
			lspconfig.tsserver.setup({
				capabilities = capabilities,
			})
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.pylsp.setup({
				capabilities = capabilities,
				settings = {
					pylsp = {
						plugins = {
							pycodestyle = {
								ignore = { "W503", "W391", "W293", "W291", "E722" },
								maxLineLength = 300,
                  cicle_complexity = 30,
							},
						},
					},
				},
			})
			lspconfig.jinja_lsp.setup({
				capabilities = capabilities,
			})
			lspconfig.gopls.setup({
				capabilities = capabilities,
			})
			lspconfig.html.setup({
				capabilities = capabilities,
			})
			lspconfig.cssls.setup({
				capabilities = capabilities,
			})
			lspconfig.jsonls.setup({
				capabilities = capabilities,
			})
			kmap.set("n", "K", vim.lsp.buf.hover, {})
			kmap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			kmap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			kmap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
