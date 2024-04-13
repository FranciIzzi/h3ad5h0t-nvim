vim.api.nvim_set_keymap("i", "<C-s>", "<Esc>:w<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-h>", "<Esc>bi", { noremap = true })
vim.api.nvim_set_keymap("i", "<C-l>", "<Esc>lwi", { noremap = true })
vim.api.nvim_set_keymap("i", "<C-z>", "<C-o>u", { noremap = true })
