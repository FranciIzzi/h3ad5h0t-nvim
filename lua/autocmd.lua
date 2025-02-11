vim.api.nvim_create_autocmd("User", {
	pattern = "GitConflictDetected",
	callback = function()
		vim.cmd("GitConflictListQf")
		local qflist = vim.fn.getqflist()
		local num_conflicts = #qflist
		if num_conflicts > 0 then
			vim.notify(num_conflicts .. " conflicted files detected")
			vim.notify("Open the quickfix list to see the details of conflicts")
		else
			vim.notify("No conflicts detected")
		end
	end,
})

vim.cmd([[
  augroup AutoFormat
    autocmd!
    autocmd BufWritePre * lua require('conform').format()
  augroup END
]])
