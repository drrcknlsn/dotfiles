return {
  {
    "williamboman/mason.nvim",
    enabled = true,
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    enabled = true,
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "eslint",
          "lua_ls",
          --"phpactor",
          "rust_analyzer",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    enabled = true,
    config = function()
      local lspconfig = require("lspconfig")

      lspconfig.eslint.setup({})
      lspconfig.lua_ls.setup({})
      --lspconfig.phpactor.setup({})
      lspconfig.rust_analyzer.setup({})
    end,
  },
}
