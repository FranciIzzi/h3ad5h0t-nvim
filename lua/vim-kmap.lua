vim.api.nvim_set_keymap("v", "c", '"+y', { noremap = true })

-- Bufferline shortcuts
vim.api.nvim_set_keymap("n", "<C-q>", ":bd<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Tab>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>dh", ":Dashboard<CR>", { noremap = true, silent = true })

-- Switch buffers shortcuts
vim.api.nvim_set_keymap("n", "<Tab>1", "<cmd>BufferLineGoToBuffer 1<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Tab>2", "<cmd>BufferLineGoToBuffer 2<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Tab>3", "<cmd>BufferLineGoToBuffer 3<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Tab>4", "<cmd>BufferLineGoToBuffer 4<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Tab>5", "<cmd>BufferLineGoToBuffer 5<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Tab>6", "<cmd>BufferLineGoToBuffer 6<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Tab>7", "<cmd>BufferLineGoToBuffer 7<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Tab>8", "<cmd>BufferLineGoToBuffer 8<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Tab>9", "<cmd>BufferLineGoToBuffer 9<CR>", { noremap = true, silent = true })

-- macro per muovere un file in verticale
vim.api.nvim_set_keymap("n", "<leader>mf", ":vsplit | Telescope find_files<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>gg", ":Neogit<CR>", { noremap = true, silent = true })

-- shortcuts for opening Trouble map
vim.api.nvim_set_keymap("n", "<leader>e", ":Trouble<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<C-s>", ":wa<CR>", { noremap = true, silent = true })

-- 0 is for going to to the beginnig of the line


-- Working with TODO file for tasks
function OpenTodoBuffer()
    vim.cmd("botright split ~/.config/nvim/TODO.md")
    vim.cmd("setlocal filetype=todo")
end

vim.cmd("command! TodoOpen lua OpenTodoBuffer()<CR>")
