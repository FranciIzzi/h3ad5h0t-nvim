local keymap = vim.api.nvim_set_keymap

keymap("v", "c", '"+y', { noremap = true })
keymap("v", "J", ":m '>+1<CR>gv=gv", { noremap = true })
keymap("v", "K", ":m '<-2<CR>gv=gv", { noremap = true })

keymap("i", "<C-s>", "<Esc>:w<CR>", { noremap = true, silent = true })
keymap("i", "<C-h>", "<Esc>bi", { noremap = true })
keymap("i", "<C-l>", "<Esc>lwi", { noremap = true })
keymap("i", "<C-z>", "<C-o>u", { noremap = true })
keymap("i", "<leader>o", "<C-o>", { noremap = true, silent = true })
keymap("i", "<C-o>", "<Nop>", { noremap = true, silent = true })


keymap("n", "<leader>p", '"_dP', { noremap = true })
keymap("n", "<leader>q", ":bd<CR>", { noremap = true, silent = true })
keymap("n", "<leader>o", "<C-o>", { noremap = true, silent = true })
keymap("n", "<C-o>", "<Nop>", { noremap = true, silent = true })

keymap("n", "<C-Up>", ":resize -2<CR>", { noremap = true, silent = true })
keymap("n", "<C-Down>", ":resize +2<CR>", { noremap = true, silent = true })
keymap("n", "<C-Left>", ":vertical resize -2<CR>", { noremap = true, silent = true })
keymap("n", "<C-Right>", ":vertical resize +2<CR>", { noremap = true, silent = true })

keymap("n", "sv", ":vsplit <CR>", { noremap = true, silent = true })
keymap("n", "sh", ":split <CR>", { noremap = true, silent = true })

vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
