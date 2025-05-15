---@diagnostic disable: undefined-global
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

vim.api.nvim_create_autocmd("DiagnosticChanged", {
	callback = function()
		local trouble = require("trouble")
		local is_open = trouble.is_open()

		local count = #vim.diagnostic.get(0)

		if is_open and count == 0 then
			trouble.close()
		end
	end,
})
