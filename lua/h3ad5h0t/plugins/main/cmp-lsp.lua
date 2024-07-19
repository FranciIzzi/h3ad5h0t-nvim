return {
  {
    "hrsh7th/cmp-nvim-lsp",
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
  },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
        }, {
          { name = "buffer" },
        }),
      })

      local ls = require("luasnip")
      local s = ls.snippet
      local t = ls.text_node
      local i = ls.insert_node
      local rep = require("luasnip.extras").rep
      -- local r = ls.restore_node
      -- local sn = ls.snippet_node
      -- local f = ls.function_node
      -- local c = ls.choice_node
      -- local d = ls.dynamic_node
      -- local l = require("luasnip.extras").lambda
      -- local p = require("luasnip.extras").partial
      -- local m = require("luasnip.extras").match
      -- local n = require("luasnip.extras").nonempty
      -- local dl = require("luasnip.extras").dynamic_lambda
      -- local fmt = require("luasnip.extras.fmt").fmt
      -- local fmta = require("luasnip.extras.fmt").fmta
      -- local types = require("luasnip.util.types")
      -- local conds = require("luasnip.extras.conditions")
      -- local conds_expand = require("luasnip.extras.conditions.expand")

      ls.add_snippets("golang", {
        s("model", {
          t("package models\n\n"),
          t('import (\n"gorm.io/gorm"\n)\n'),
          t("type "),
          i(1),
          t(" struct {\ngorm.Model\n}\n"),
          t("func ("),
          rep(1),
          t(") TableName() string {\nreturn \""),
          i(2),
          t("\"\n}\n"),
        }),
      })
    end,
  },
}
