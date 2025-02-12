return {
	{
		"nvim-orgmode/orgmode",
		event = "VeryLazy",
		lazy = true,
		ft = { "org" },
		config = function()
			require("orgmode").setup({
				org_agenda_files = "~/.config/nvim/orgfiles/**/*",
				org_default_notes_file = "~/.config/nvim/orgfiles/refile.org",
			})
		end,
	},
}
