return {
  {
    "nvim-treesitter/nvim-treesitter",
    enabled = true,
    build = ":TSUpdate",
    config = function()
      local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()

      parser_configs.blade = {
        install_info = {
          url = "https://github.com/EmranMR/tree-sitter-blade",
          files = { "src/parser.c" },
          branch = "main",
        },
        filetype = "blade",
      }

      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = {
          "bash",
          "blade",
          "css",
          "csv",
          "dockerfile",
          "html",
          "javascript",
          "jsdoc",
          "json",
          "lua",
          "markdown",
          "php",
          "php_only",
          "phpdoc",
          "rust",
          "scss",
          "sql",
          "toml",
          "tsx",
          "typescript",
          "xml",
          "yaml",
        },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    enabled = true,
    config = function()
      vim.keymap.set("n", "[c", function()
        require("treesitter-context").go_to_context(vim.v.count1)
      end, { silent = true })
    end,
  },
}
