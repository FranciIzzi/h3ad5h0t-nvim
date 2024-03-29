-- use vim.cmd in lua language for run a vim command
-- Set up of Tab
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- Cursor settings --
vim.cmd("set guicursor=n-v-c:block-Cursor/lCursor,i-ci-ve:block-Cursor/lCursor,r-cr-o:block-Cursor/lCursor")

vim.cmd("set number")
vim.cmd("set autoindent")
vim.cmd("set mouse=a")

vim.g.mapleader = " "

local opt = vim.opt

-- Search settings --
opt.ignorecase = true
opt.smartcase = true

opt.termguicolors = true
opt.signcolumn = "yes"
opt.backspace = "indent,eol,start"
opt.clipboard:append("unnamedplus")

-- split windows --
opt.splitright = true
opt.splitbelow = true

opt.cursorline = true

vim.cmd[[
  highlight CursorLineNr term=bold  cterm=bold gui=bold guifg=#FFD700
]]

