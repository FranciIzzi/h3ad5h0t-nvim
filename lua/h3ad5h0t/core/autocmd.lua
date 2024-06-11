vim.api.nvim_create_autocmd("BufLeave", {
	callback = function()
		local buffers = vim.api.nvim_list_bufs()
		local visible_buffer_count = 0
		for _, buf in pairs(buffers) do
			if vim.api.nvim_buf_is_loaded(buf) and vim.api.nvim_buf_get_option(buf, "buflisted") then
				visible_buffer_count = visible_buffer_count + 1
			end
		end
		if visible_buffer_count == 1 then
			local line_count = vim.api.nvim_buf_line_count(0)
			if line_count == 1 and vim.api.nvim_get_current_line() == "" then
				vim.cmd("Dashboard")
			end
		end
	end,
})

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
  augroup TsxTagInsert
    autocmd!
  augroup END
]])

vim.api.nvim_create_autocmd({ "BufEnter", "BufNewFile" }, {
	pattern = { "*.tsx" },
	group = "TsxTagInsert",
	callback = function()
		vim.api.nvim_set_keymap("n", "tag", ":lua insert_html_tag()<CR>", { noremap = true, silent = true })
	end,
})
