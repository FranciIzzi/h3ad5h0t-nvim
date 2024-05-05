vim.api.nvim_set_keymap("v", "c", '"+y', { noremap = true })
vim.api.nvim_set_keymap("v", "J", ":m '>+1<CR>gv=gv", { noremap = true })
vim.api.nvim_set_keymap("v", "K", ":m '<-2<CR>gv=gv", { noremap = true })

vim.api.nvim_set_keymap("i", "<C-s>", "<Esc>:w<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-h>", "<Esc>bi", { noremap = true })
vim.api.nvim_set_keymap("i", "<C-l>", "<Esc>lwi", { noremap = true })
vim.api.nvim_set_keymap("i", "<C-z>", "<C-o>u", { noremap = true })

vim.api.nvim_set_keymap("n", "<leader>p", "\"_dP", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>q", ":bd<CR>", { noremap = true, silent = true })

