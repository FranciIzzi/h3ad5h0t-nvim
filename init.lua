-- Check the existence of Lazy path, if not install it (Package manager)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("vim-options")
require("lazy").setup("plugins")
require("vim-kmap")
require("keymap-insertMode")

-- Definisci il gruppo di autocmd per evitare duplicazioni
vim.cmd [[
  augroup TsxTagInsert
    autocmd!
  augroup END
]]

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
vim.api.nvim_create_autocmd({"BufEnter", "BufNewFile"}, {
    pattern = {"*.tsx"},
    group = "TsxTagInsert",
    callback = function()
        vim.api.nvim_set_keymap("n", "<leader>ht", ":lua insert_html_tag()<CR>", {noremap = true, silent = true})
    end,
})

vim.api.nvim_create_autocmd({"BufLeave"}, {
    pattern = {"*.tsx"},
    group = "TsxTagInsert",
    callback = function()
        safe_del_keymap('n', '<leader>ht')
    end,
})

