local indentation = vim.api.nvim_create_augroup("language_indentation", {
  clear = true,
})

local function set_indent(filetypes, width)
  vim.api.nvim_create_autocmd("FileType", {
    group = indentation,
    pattern = filetypes,
    callback = function()
      vim.opt_local.expandtab = true
      vim.opt_local.shiftwidth = width
      vim.opt_local.tabstop = width
      vim.opt_local.softtabstop = width
    end,
  })
end

set_indent({ "c", "cpp", "php" }, 4)
set_indent({ "lua", "javascript", "javascriptreact", "typescript", "typescriptreact" }, 2)
