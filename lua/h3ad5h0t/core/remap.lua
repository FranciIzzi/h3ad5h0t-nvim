local keymap = vim.api.nvim_set_keymap

keymap("v", "c", '"+y', { noremap = true })
keymap("v", "J", ":m '>+1<CR>gv=gv", { noremap = true })
keymap("v", "K", ":m '<-2<CR>gv=gv", { noremap = true })
-- keymap("v", "<", ":m <gv", { noremap = true , silent = true })
-- keymap("v", ">", ":m >gv", { noremap = true  , silent = true })

keymap("i", "<C-s>", "<Esc>:w<CR>", { noremap = true, silent = true })
keymap("i", "<C-h>", "<Esc>bi", { noremap = true })
keymap("i", "<C-l>", "<Esc>lwi", { noremap = true })
keymap("i", "<C-z>", "<C-o>u", { noremap = true })

keymap("n", "<leader>p", '"_dP', { noremap = true })
keymap("n", "<leader>q", ":bd<CR>", { noremap = true, silent = true })

keymap("n", "<C-Up>", ":resize -2<CR>", { noremap = true, silent = true })
keymap("n", "<C-Down>", ":resize +2<CR>", { noremap = true, silent = true })
keymap("n", "<C-Left>", ":vertical resize -2<CR>", { noremap = true, silent = true })
keymap("n", "<C-Right>", ":vertical resize +2<CR>", { noremap = true, silent = true })
