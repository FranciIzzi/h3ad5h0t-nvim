local keymap = vim.api.nvim_set_keymap

-- BufferLine Command
keymap("n", "<leader>bco", ":BufferLineCloseOthers<CR>", { noremap = true, silent = true })
keymap("n", "<leader>bch", ":BufferLineCloseRight<CR>", { noremap = true, silent = true })
keymap("n", "<leader>bcl", ":BufferLineCloseLeft<CR>", { noremap = true, silent = true })
keymap("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
keymap("n", "<Tab>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })

-- Split + Telescope
keymap("n", "sv", ":vsplit <CR>", { noremap = true, silent = true })
keymap("n", "sh", ":split <CR>", { noremap = true, silent = true })
keymap("n", "<leader>mv", ":vsplit | Telescope find_files<CR>", { noremap = true, silent = true })
keymap("n", "<leader>mh", ":split | Telescope find_files<CR>", { noremap = true, silent = true })

-- Git Keymap
keymap("n", "<leader>gg", ":Neogit<CR>", { noremap = true, silent = true })

-- Format File
keymap("n", "<leader>gf", ':lua require("conform").format()<CR>', { noremap = true, silent = true })

keymap("n", "<leader>e", ":Trouble diagnostics<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>n", "<cmd>lua HandleNeoTree()<CR>", { silent = true, noremap = true })

-- Resize Windows
keymap("n", "<C-Up>", ":resize -2<CR>", { noremap = true, silent = true })
keymap("n", "<C-Down>", ":resize +2<CR>", { noremap = true, silent = true })
keymap("n", "<C-Left>", ":vertical resize -2<CR>", { noremap = true, silent = true })
keymap("n", "<C-Right>", ":vertical resize +2<CR>", { noremap = true, silent = true })

keymap("v", "J", ":m '>+1<CR>gv=gv", { noremap = true })
keymap("v", "K", ":m '<-2<CR>gv=gv", { noremap = true })

function HandleNeoTree()
	local is_neo_tree_open = function()
		for _, win in pairs(vim.api.nvim_list_wins()) do
			if vim.bo[vim.api.nvim_win_get_buf(win)].filetype == "neo-tree" then
				return true
			end
		end
		return false
	end

	if is_neo_tree_open() then
		vim.cmd("Neotree close")
	else
		vim.cmd("Neotree filesystem reveal left")
	end
end
