return {
  "L3MON4D3/LuaSnip",
  lazy = true,
  build = "make install_jsregexp",
  dependencies = {
    dir = vim.env.HOME .. "/Projects/nvim-plugins/mySnippets",
    opts = { path = vim.env.HOME .. "/Projects/nvim-plugins/mySnippets/snippets" },
  },
  config = function()
    local ls = require("luasnip")
    local types = require("luasnip.util.types")

    ls.setup({
      update_events = "TextChanged,TextChangedI",
      enable_autosnippets = true,
      ext_opts = {
        [types.choiceNode] = { active = { virt_text = { { "○", "Special" } } } },
        [types.insertNode] = { active = { virt_text = { { "", "Boolean" } } } },
      },
    })
  end,
  keys = function()
    return {}
  end,
}
