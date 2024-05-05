vim.api.nvim_set_keymap("v", "c", '"+y', { noremap = true })
vim.api.nvim_set_keymap("v", "J", ":m '>+1<CR>gv=gv", { noremap = true })
vim.api.nvim_set_keymap("v", "K", ":m '<-2<CR>gv=gv", { noremap = true })

function RegisterCode()
	local code_file = vim.fn.expand("~/.config/nvim/code.txt")
	local file_exists = vim.fn.filereadable(code_file) == 1
	if not file_exists then
		local f = io.open(code_file, "w")
		if f then
			f:close()
		else
			print("Impossibile aprire il file: " .. code_file)
		end
	end
	local selected_text = vim.fn.getreg('"')
	local save_path = "/percorso/della/cartella/mia_selezione.txt"
	print("Salvataggio del testo selezionato in: " .. save_path)
  print(selected_text)
end

vim.api.nvim_set_keymap("v", "yr", ":lua RegisterCode()<CR>", { noremap = true, silent = true })
