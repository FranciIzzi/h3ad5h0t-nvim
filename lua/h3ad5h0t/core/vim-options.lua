vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd([[set guicursor=n-v-c:block-Cursor/lCursor,r-cr-o:block-Cursor/lCursor,i-ci-ve:ver25-Cursor/lCursor]])
vim.cmd([[
  highlight CursorLineNr term=bold  cterm=bold gui=bold guifg=#FFD700
]])
vim.cmd("set number")
vim.cmd("set autoindent")
vim.cmd("set mouse=a")
vim.g.mapleader = " "
local opt = vim.opt

vim.g.have_nerd_font=true
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
