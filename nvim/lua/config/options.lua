vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Show line numbers (default: false)
vim.wo.number = true
-- Show line numbers relative to cursor (default: false)
vim.wo.relativenumber = true

-- Highlight the line the cursor is on (default: false)
vim.wo.cursorline = true
-- Highlight the column the cursor is on (default: false)
vim.wo.cursorcolumn = true

-- Always show the sign column (default: 'auto')
--vim.wo.signcolumn = 'yes'
vim.wo.signcolumn = 'number'

-- Convert tabs to equivalent # of space characters (default: false)
vim.o.expandtab = true
-- ???
vim.o.smarttab = true

local chars_per_indent = 4

-- Character width of each indentation level (default: 8)
vim.o.shiftwidth = chars_per_indent
-- (default: 8)
vim.o.tabstop = chars_per_indent
-- ???
vim.o.softtabstop = chars_per_indent
-- Indent new lines (default: true)
vim.o.autoindent = true
-- ???
vim.o.smartindent = true
-- ???
vim.o.cindent = true

vim.o.colorcolumn = '80'

-- Highlight search results (default: true)
vim.o.hlsearch = true
-- Incremental search - search as you type (default: true)
vim.o.incsearch = true
-- Case insensitive search (default: false)
vim.o.ignorecase = true
-- Only use case-insensitive search for uppercase searches (default: false)
vim.o.smartcase = true

-- Don't show "--INSERT--" (default: true)
vim.o.showmode = false

-- Always show tab line (default: 1)
vim.o.showtabline = 2

-- Keeps some lines between the cursor and edge of screen (default: 0)
vim.o.scrolloff = 5
vim.o.sidescrolloff = 5

vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = true
vim.o.undofile = true
--vim.o.backupdir:remove('.')

--vim.o.splitbelow = true
--vim.o.splitright = true

-- Folding --
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.o.foldenable = false -- zi toggles
-- vim.o.foldlevel = 99

-- Disable mouse support
vim.o.mouse = ''
