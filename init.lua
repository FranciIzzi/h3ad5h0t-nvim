---@diagnostic disable: undefined-global
--
-- Setup the Package Manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

vim.g.VM_mouse_mappings = 1
vim.g.VM_default_mappings = 1
vim.g.VM_silent_exit = 1

vim.g.rustfmt_autosave = 1

vim.g.python3_host_prog = os.getenv("HOME") .. "/Desktop/.myEnvs/venv/bin/python"
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

-- -- Plugins Dirs
require("lazy").setup({
	{ import = "plugins" },
	{ import = "plugins.lazy" },
})

-- -- Loading degli Snippets
require("luasnip.loaders.from_lua").lazy_load({ paths = { "./lua/snippets" } })

-- -- Setup dei Keybinding
require("keymaps")

-- -- Setup degli AutoCommands
require("autocmd")

-- Cursor settings
vim.cmd([[set guicursor=n-v-c:block-Cursor/lCursor,r-cr-o:block-Cursor/lCursor,i-ci-ve:ver25-Cursor/lCursor]])
vim.cmd([[
  highlight CursorLineNr term=bold  cterm=bold gui=bold guifg=#FFD700
]])
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set autoindent")
vim.cmd("set tabstop=2")
vim.cmd("set expandtab")
vim.cmd("set mouse=a")
vim.cmd("set number")
local opt = vim.opt
opt.relativenumber = true
opt.ignorecase = true
opt.smartcase = true
opt.termguicolors = true
opt.signcolumn = "yes"
opt.backspace = "indent,eol,start"
opt.clipboard:append("unnamedplus")
opt.autowrite = true
opt.autoread = true
opt.splitright = true
opt.splitbelow = true
opt.cursorline = true
opt.undofile = true
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
