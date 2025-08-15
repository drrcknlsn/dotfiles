local map = require('config.util').map

map('n', '<leader>h', '<C-W>h')
map('n', '<leader>l', '<C-W>l')
map('n', '<leader>j', '<C-W>j')
map('n', '<leader>k', '<C-W>k')

-- Keep last yanked when pasting
map('v', 'p', '"_dP')

-- Don't mess with registers when deleting character
map('n', 'x', '"_x')

map('n', '<leader>n', vim.diagnostic.goto_next)
map('n', '<leader>p', vim.diagnostic.goto_prev)
-- not sure what this does
map('n', '<leader>d', vim.diagnostic.open_float)
-- show errors in bottom list
map('n', '<leader>qd', vim.diagnostic.setloclist)

-- Quickly exit from insert mode
--map('i', 'jk', '<esc>')
--map('i', 'kj', '<esc>')
