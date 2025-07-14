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

-- Flutter Log
-- group = vim.api.nvim_create_augroup("FlutterLogBuffer", {}),
-- Highlight personalizzato per i log
-- vim.api.nvim_set_hl(0, "FlutterError", { fg = "#ff5555", bold = true })
-- vim.api.nvim_set_hl(0, "FlutterWarning", { fg = "#ffb86c" })
-- vim.api.nvim_create_autocmd("BufEnter", {
-- 	pattern = "__FLUTTER_DEV_LOG__",
-- 	callback = function(args)
-- 		local buf = args.buf
-- 		vim.b[buf].is_flutter_log = true
--
-- 		vim.api.nvim_buf_create_user_command(buf, "FlutterFilter", function(opts)
-- 			local pattern = opts.args
-- 			local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
-- 			local filtered = vim.tbl_filter(function(line)
-- 				return line:match(pattern)
-- 			end, lines)
-- 			vim.api.nvim_buf_set_lines(buf, 0, -1, false, filtered)
-- 		end, { desc = "Filtra log con pattern", nargs = 1 })
--
-- 		vim.api.nvim_create_autocmd("TextChanged", {
-- 			pattern = "__FLUTTER_DEV_LOG__",
-- 			group = "FlutterLogGroup",
-- 			callback = function()
-- 				vim.api.nvim_win_set_cursor(0, { vim.api.nvim_buf_line_count(0), 0 })
-- 			end,
-- 		})
--
-- 		-- Syntax match per errori e warning
-- 		vim.cmd([[
--       syntax match FlutterError /E\/flutter.*/
--       syntax match FlutterWarning /W\/flutter.*/
--       highlight link FlutterError Error
--       highlight link FlutterWarning WarningMsg
--     ]])
--
-- 		-- Mappatura tastiera locale
-- 		vim.keymap.set("n", "cl", "<cmd>FlutterLogClear <CR>", { buffer = buf })
-- 		vim.keymap.set("n", "ff", "<cmd>FlutterFilter <CR>", { buffer = buf })
-- 		vim.keymap.set("n", "r", "<cmd>FlutterReload <CR>", { buffer = buf })
-- 		vim.keymap.set("n", "q", "<cmd>FlutterQuit <CR>", { buffer = buf })
-- 		vim.keymap.set("n", "s", "<cmd>FlutterRun <CR>", { buffer = buf })
-- 	end,
-- })
