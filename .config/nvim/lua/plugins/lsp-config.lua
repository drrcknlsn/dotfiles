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
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          vim.keymap.set(
            "n",
            "gd",
            vim.lsp.buf.definition,
            { buffer = args.buf, desc = "LSP: Go to definition" }
          )
        end,
      })

      vim.lsp.config("lua_ls", {
        --capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = {
                vim.env.VIMRUNTIME,
              },
            },
          },
        },
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

      vim.lsp.config("clangd", {
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
        },
      })

      vim.lsp.enable("lua_ls")
      vim.lsp.enable("eslint")
      --vim.lsp.enable("phpactor")
      vim.lsp.enable("rust_analyzer")
      vim.lsp.enable("clangd")
    end,
  },
}
