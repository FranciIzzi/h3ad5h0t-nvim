-- Working with TODO file for tasks
function OpenTodoBuffer()
   vim.cmd("botright split ~/.config/nvim/TODO.md")
   vim.cmd("setlocal filetype=todo")
end

vim.cmd("command! TodoOpen lua OpenTodoBuffer()<CR>")

