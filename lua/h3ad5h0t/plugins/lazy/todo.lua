return {
  "aserebryakov/vim-todo-lists",
  ft = { "markdown", "todo", "txt" },
  config = function()
    vim.g.VimTodoListsUndoneItem = "- [ ]"
    vim.g.VimTodoListsDoneItem = "- [X]"
    vim.g.todo_list_filename = "list.todo.md"
  end,
}
