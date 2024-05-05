function OpenTodo()
	local todo_file = vim.fn.expand("~/.config/nvim/list.todo.md")
	local file_exists = vim.fn.filereadable(todo_file) == 1
	if not file_exists then
		local f = io.open(todo_file, "w")
		if f then
			f:close()
		else
			print("Impossibile aprire il file: " .. todo_file)
		end
	end
	vim.cmd("botright split " .. todo_file)
	vim.cmd("setlocal filetype=todo")
end

vim.cmd("command! TodoOpen lua OpenTodo()<CR>")

vim.cmd([[
  autocmd BufEnter list.todo.md command! -buffer CloseTodo :bd!
  autocmd BufEnter list.todo.md command! -buffer TodoTitle ::lua createTodoTitle()<CR>]])

vim.cmd([[
  autocmd FileType markdown if expand('%:t') == 'list.todo.md' | nnoremap <buffer> q :CloseTodo<CR> | endif
]])

function createTodoTitle()
	local title = vim.fn.input("Inserisci il titolo del TODO: ").upper()
	local line_number = tonumber(vim.fn.input("Inserisci il numero di linea: "))
	vim.fn.append(line_number, "..." .. title)
end

vim.cmd([[
  autocmd FileType markdown if expand('%:t') == 'list.todo.md' | command! -buffer TodoTitle :lua createTodoTitle()<CR> | endif
]])
