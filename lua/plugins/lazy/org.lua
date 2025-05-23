return {
	{
		"nvim-orgmode/orgmode",
		event = "VeryLazy",
		ft = { "org" },
		lazy = true,
		config = function()
			require("orgmode").setup({
				org_agenda_files = "~/.config/nvim/orgfiles/**/*",
				org_default_notes_file = "~/.config/nvim/orgfiles/refile.org",
			})
		end,
	},
}
