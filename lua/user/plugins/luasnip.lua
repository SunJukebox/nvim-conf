return {
  "L3MON4D3/LuaSnip",
  config = function(_, opts)
    local ls = require("luasnip")
    ls.setup(opts)

    require("luasnip.loaders.from_lua").lazy_load({
      paths = {
        vim.fn.stdpath("config") .. "/snippets/snips",
      },
    })

    vim.keymap.set({ "i", "s" }, "<C-@>", function()
      if ls.choice_active() then
        ls.change_choice(1)
      end
    end, { desc = "LuaSnip Next Choice" })
  end,
  opts = function()
    local types = require("luasnip.util.types")
    return {
      update_events = "TextChanged,TextChangedI",
      enable_autosnippets = true,
      ext_opts = {
        [types.choiceNode] = {
          active = {
            virt_text = { { "", "Special" } },
          },
        },
        [types.insertNode] = {
          active = {
            virt_text = { { "", "Boolean" } },
          },
        },
      },
    }
  end,
  keys = function()
    return {}
  end,
}
