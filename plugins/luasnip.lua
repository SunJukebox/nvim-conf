return function()
  local ls = require "luasnip"
  local types = require "luasnip.util.types"

  ls.config.setup {
    update_events = "TextChanged, TextChangedI",
    enable_autosnippets = true,
    ext_opts = {
      [types.choiceNode] = {
        active = {
          virt_text = { { "<- Current Choice", "NonText" } },
        },
      },
    },
  }

  vim.keymap.set("i", "<C-l>", function()
    if ls.choice_active() then ls.change_choice(1) end
  end, { desc = "LuaSnip Next Choice" })

  require("luasnip.loaders.from_lua").lazy_load { paths = vim.fn.stdpath "config" .. "/lua/user/luasnippets" }

  local status_ok, loader = pcall(require, "luasnip/loaders/from_vscode")
  if status_ok then loader.load { exclude = { "tex", "lua", "cpp" } } end
end
