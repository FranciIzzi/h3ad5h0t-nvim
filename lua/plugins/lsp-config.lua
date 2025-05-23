return {
	---@diagnostic disable: undefined-global
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"stevearc/conform.nvim",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/nvim-cmp",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"j-hui/fidget.nvim",
		},

		config = function()
			require("conform").setup({
				format_on_save = {
					timeout_ms = 500,
					lsp_format = "fallback",
				},
				formatters_by_ft = {
					lua = { "stylua" },
					sh = { "beautysh" },
					zsh = { "beautysh" },
					bash = { "beautysh" },
					python = { "isort", "black" },
					go = { "goimports", "gofumpt" },
					javascript = { "prettier", "prettierd", stop_after_first = true },
					typescript = { "prettier", "prettierd", stop_after_first = true },
					typescriptreact = { "prettier", "prettierd", stop_after_first = true },
					javascriptreact = { "prettier", "prettierd", stop_after_first = true },
				},
			})
			local kmap = vim.keymap
			kmap.set("n", "K", vim.lsp.buf.hover, {})
			kmap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			kmap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			kmap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
			local cmp = require("cmp")
			local cmp_lsp = require("cmp_nvim_lsp")
			local capabilities = vim.tbl_deep_extend(
				"force",
				{},
				vim.lsp.protocol.make_client_capabilities(),
				cmp_lsp.default_capabilities()
			)
			require("fidget").setup({})
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"gopls",
					"ts_ls",
					"pylsp",
					"bashls",
					"prismals",
					"tailwindcss",
					"rust_analyzer",
				},
				handlers = {
					function(server_name) -- default handler (optional)
						require("lspconfig")[server_name].setup({
							capabilities = capabilities,
						})
					end,
					["lua_ls"] = function()
						local lspconfig = require("lspconfig")
						lspconfig.lua_ls.setup({
							capabilities = capabilities,
							settings = {
								Lua = {
									diagnostics = {
										globals = { "vim", "bit", "it", "describe", "before_eachj", "after_each" },
										disable = { "undefined-global" },
									},
									workspace = {
										checkThirdParty = false, -- Evita warning su plugin esterni
									},
								},
							},
						})
					end,
					["pylsp"] = function()
						local lspconfig = require("lspconfig")
						lspconfig.pylsp.setup({
							capabilities = capabilities,
							settings = {
								pylsp = {
									plugins = {
										pycodestyle = {
											ignore = { "E501", "W503", "W391", "E203" },
											maxLineLength = 150,
										},
									},
								},
							},
						})
					end,
				},
			})

			local cmp_select = { behavior = cmp.SelectBehavior.Select }

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
					["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
					["<C-y>"] = cmp.mapping.confirm({ select = true }),
					["<C-Space>"] = cmp.mapping.complete(),
				}),
				sources = cmp.config.sources({
					{ name = "codeium" },
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
				}, {
					{ name = "buffer" },
				}),
			})

			vim.diagnostic.config({

				float = {
					focusable = false,
					style = "minimal",
					border = "rounded",
					source = "always",
					header = "",
					prefix = "",
				},
			})
		end,
	},
}
