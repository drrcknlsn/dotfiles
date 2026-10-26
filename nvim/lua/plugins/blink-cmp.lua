return {
  {
    "saghen/blink.cmp",
    version = "1.*",
    opts = {
      keymap = {
        preset = "default",

        ["<D-j>"] = { "select_next", "fallback" },
        ["<D-k>"] = { "select_prev", "fallback" },
        ["<D-CR>"] = { "accept", "fallback" },
      },
    },
  },
}
