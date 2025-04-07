local newSet = vim.keymap.set
local keymap = vim.api.nvim_set_keymap

-- BufferLine Commands
keymap("n", "<leader>bco", ":BufferLineCloseOthers<CR>", { noremap = true, silent = true })
keymap("n", "<leader>bch", ":BufferLineCloseRight<CR>", { noremap = true, silent = true })
keymap("n", "<leader>bcl", ":BufferLineCloseLeft<CR>", { noremap = true, silent = true })
keymap("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
keymap("n", "<Tab>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })

-- Terminal Commands
newSet("n", "stj", ":lua SendTerminalJob()<CR>", { noremap = true, silent = true })
keymap("n", "<leader>nt", "<cmd>terminal<CR>", { noremap = true, silent = true })
newSet("t", "<Esc>", "<C-\\><C-n>", { noremap = true })

-- Split + Telescope
keymap("n", "<leader>sv", "<cmd>lua Find_files_in_split('vsplit')<CR>", { noremap = true, silent = true })
keymap("n", "<leader>sh", "<cmd>lua Find_files_in_split('split')<CR>", { noremap = true, silent = true })
keymap("n", "svt", ":vsplit | terminal <CR>", { noremap = true, silent = true })
keymap("n", "sht", ":split | terminal<CR>", { noremap = true, silent = true })
keymap("n", "sv", ":vsplit <CR>", { noremap = true, silent = true })
keymap("n", "sh", ":split <CR>", { noremap = true, silent = true })

-- Git Keymap
keymap("n", "<leader>gg", ":Neogit<CR>", { noremap = true, silent = true })

-- Format File
keymap("n", "<leader>gf", ':lua require("conform").format()<CR>', { noremap = true, silent = true })
keymap("n", "<leader>e", ":Trouble diagnostics<CR>", { noremap = true, silent = true })

newSet("n", "<leader>n", "<cmd>Neotree filesystem reveal left<CR>", { silent = true, noremap = true })
newSet("n", "<leader>nc", "<cmd>Neotree close<CR>", { silent = true, noremap = true })

-- Resize Windows
keymap("n", "<C-Up>", ":resize -2<CR>", { noremap = true, silent = true })
keymap("n", "<C-Down>", ":resize +2<CR>", { noremap = true, silent = true })
keymap("n", "<C-Left>", ":vertical resize -2<CR>", { noremap = true, silent = true })
keymap("n", "<C-Right>", ":vertical resize +2<CR>", { noremap = true, silent = true })

keymap("v", "J", ":m '>+1<CR>gv=gv", { noremap = true })
keymap("v", "K", ":m '<-2<CR>gv=gv", { noremap = true })

keymap("v", "<", "<gv", { noremap = true })
keymap("v", ">", ">gv", { noremap = true })

-- Forward/Backward curor position
newSet("n", "<leader>o", "<C-o>", { desc = "Jump back" })
newSet("n", "<leader>i", "<C-i>", { desc = "Jump forward" })

function Find_files_in_split(split_type)
	require("telescope.builtin").find_files({
		attach_mappings = function(_, map)
			map("i", "<CR>", function(prompt_bufnr)
				local action_state = require("telescope.actions.state")
				local actions = require("telescope.actions")
				local selection = action_state.get_selected_entry()
				if selection then
					actions.close(prompt_bufnr)
					vim.cmd(split_type .. " " .. selection.path)
				end
			end)
			return true
		end,
	})
end

function SendTerminalJob()
	local cmd = vim.fn.input("Command to execute: ")
	if cmd == "" then
		return
	end
	local term_buf = nil
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if vim.bo[buf].buftype == "terminal" then
			term_buf = buf
			break
		end
	end
	if not term_buf then
		vim.cmd("split | terminal")
		vim.cmd("wincmd J")
		term_buf = vim.api.nvim_get_current_buf()
	end
	vim.api.nvim_chan_send(vim.b[term_buf].terminal_job_id, cmd .. "\n")
end
