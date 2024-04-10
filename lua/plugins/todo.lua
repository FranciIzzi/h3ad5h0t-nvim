return {
	"aserebryakov/vim-todo-lists",
	config = function()
		vim.g.VimTodoListsUndoneItem = "- [ ]"
		vim.g.VimTodoListsDoneItem = "- [X]"
		vim.g.todo_list_filename = "TODO.md"
	end,
}
