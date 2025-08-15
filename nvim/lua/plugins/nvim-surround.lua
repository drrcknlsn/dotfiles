return {
  "kylechui/nvim-surround",
  enabled = true,
  version = "*",
  event = "VeryLazy",
  config = function()
    require("nvim-surround").setup({
      -- Configuration here, or leave empty to use defaults
    })
  end,
}
