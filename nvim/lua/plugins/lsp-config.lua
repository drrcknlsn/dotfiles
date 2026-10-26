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
      vim.lsp.config("lua_ls", {
        --capabilities = capabilities,
      })

      vim.lsp.config("eslint", {
        --capabilities = capabilities,
      })

      --vim.lsp.config("phpactor", {
        --capabilities = capabilities,
      --})

      vim.lsp.config("rust_analyzer", {
        --capabilities = capabilities,
      })

      vim.lsp.enable("lua_ls")
      vim.lsp.enable("eslint")
      --vim.lsp.enable("phpactor")
      vim.lsp.enable("rust_analyzer")
    end,
  },
}
