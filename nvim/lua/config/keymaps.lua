local map = require('config.util').map

map('n', '<leader>h', '<C-W>h')
map('n', '<leader>l', '<C-W>l')
map('n', '<leader>j', '<C-W>j')
map('n', '<leader>k', '<C-W>k')

-- Keep last yanked when pasting
map('v', 'p', '"_dP')

-- Don't mess with registers when deleting character
map('n', 'x', '"_x')

-- not sure what this does
map('n', '<leader>d', vim.diagnostic.open_float)
-- show errors in bottom list
map('n', '<leader>qd', vim.diagnostic.setloclist)

-- Quickly exit from insert mode
--map('i', 'jk', '<esc>')
--map('i', 'kj', '<esc>')

-- Autocomplete
map("i", "<D-j>", function()
  return vim.fn.pumvisible() == 1 and "<C-n>" or "<D-j>"
end, { expr = true, replace_keycodes = true })

map("i", "<D-k>", function()
  return vim.fn.pumvisible() == 1 and "<C-p>" or "<D-k>"
end, { expr = true, replace_keycodes = true })

map("i", "<D-CR>", function()
  return vim.fn.pumvisible() == 1 and "<C-y>" or "<D-CR>"
end, { expr = true, replace_keycodes = true })

-- Formatting
vim.keymap.set("n", "<leader>t", function()
  vim.lsp.buf.format({
    -- using `true` here causes nvim to eat keys sometimes
    async = false,
    -- this would be needed if e.g. a file type had multiple LSPs attached that supported formatting
    --filter = function(client)
      --return client.name == "clangd"
    --end,
  })
end, {
  silent = true,
  desc = "Format current buffer",
})

-- Jumplist
-- gb jumps back after gd (go to definition)
-- C-only: gh switches between source and header files
map("n", "gb", "<C-o>", { desc = "Jump back" })
map("n", "gh", "<cmd>LspClangdSwitchSourceHeader<cr>", {
  desc = "Switch between source and header",
})

-- Diagnostics
-- <leader>n moves to the next diagnostic and opens a float
-- <leader>p moves to the previous diagnostic and opens a float
vim.diagnostic.config({
  jump = {
    on_jump = function(_, bufnr)
      vim.diagnostic.open_float({
        bufnr = bufnr,
        scope = "cursor",
        focus = false,
      })
    end,
  },
})

map("n", "<leader>n", function()
  vim.diagnostic.jump({ count = 1 })
end, { desc = "Diagnostic: next" })

map("n", "<leader>p", function()
  vim.diagnostic.jump({ count = -1 })
end, { desc = "Diagnostic: previous" })

pcall(vim.keymap.del, "n", "]d")
pcall(vim.keymap.del, "n", "[d")
