return {
  {
    "adisen99/apprentice.nvim",
    enabled = false,
    dependencies = {
      "rktjmp/lush.nvim",
    },
    config = function()
      vim.cmd("colorscheme apprentice")
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    enabled = true,
    config = function()
      require("catppuccin").setup({
        transparent_background = true,
        dim_inactive = {
          enabled = true,
          percentage = 0.5,
        },
      })

      vim.cmd.colorscheme("catppuccin")
    end,
  },
  {
    "dracula/vim",
    enabled = false,
    config = function()
      vim.cmd("colorscheme dracula")
    end,
  },
  {
    "shaunsingh/nord.nvim",
    enabled = false,
    config = function()
      vim.cmd("colorscheme nord")
    end,
  },
}
