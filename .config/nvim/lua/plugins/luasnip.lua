local map = require("config.util").map

return {
  "L3MON4D3/LuaSnip",
  version = "v2.*",
  build = "make install_jsregexp",
  config = function(_, opts)
    local ls = require('luasnip')

    ls.setup(opts)

    require('luasnip.loaders.from_lua').load({
      paths = "~/.config/nvim/lua/snippets",
    })

    map({ 'i', 's' }, '<D-k>', function()
      if ls.expand_or_jumpable() then
        ls.expand_or_jump()
      end
    end)

    map({ 'i', 's' }, '<D-j>', function()
      if ls.jumpable(-1) then
        ls.jump(-1)
      end
    end)
  end
}
