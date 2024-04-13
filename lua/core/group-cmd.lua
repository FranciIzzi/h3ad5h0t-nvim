-- Definisci il gruppo di autocmd per evitare duplicazioni
vim.cmd([[
  augroup TsxTagInsert
    autocmd!
  augroup END
]])

-- Funzione per rimuovere una mappatura dei tasti in modo sicuro
local function safe_del_keymap(mode, lhs)
  -- Tentativo di rimozione della mappatura, cattura eventuali errori
  local status, err = pcall(vim.api.nvim_del_keymap, mode, lhs)
  if not status then
    -- Log dell'errore, se necessario, o ignoralo
    print("Attempted to remove non-existent keymap:", lhs, "Error:", err)
  end
end

-- Aggiungi l'autocmd per definire la mappatura solo per i file .tsx
vim.api.nvim_create_autocmd({ "BufEnter", "BufNewFile" }, {
  pattern = { "*.tsx" },
  group = "TsxTagInsert",
  callback = function()
    vim.api.nvim_set_keymap("n", "html", ":lua insert_html_tag()<CR>", { noremap = true, silent = true })
  end,
})

vim.api.nvim_create_autocmd({ "BufLeave" }, {
  pattern = { "*.tsx" },
  group = "TsxTagInsert",
  callback = function()
    safe_del_keymap("n", "<leader>ht")
  end,
})
