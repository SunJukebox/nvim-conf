return function()
  local ls = require "luasnip"
  local types = require "luasnip.util.types"

  ls.config.setup {
    update_events = "TextChanged,TextChangedI",
    enable_autosnippets = true,
    ext_opts = {
      [types.choiceNode] = {
        active = {
          virt_text = { { "<- Current Choice", "NonText" } },
        },
      },
      -- [types.insertNode] = {
      -- 	active = {
      -- 		virt_text = { { '◍', 'DiagnosticSignHint' } },
      -- 	},
      -- },
    },
  }

  --[[
  vim.keymap.set({ 'i', 's' }, '<C-j>', function()
    if ls.expand_or_locally_jumpable() then
      ls.expand_or_jump()
    end
  end, { desc = 'LuaSnip Forward Jump' })
  vim.keymap.set({ 'i', 's' }, '<C-k>', function()
    if ls.jumpable(-1) then
      ls.jump(-1)
    end
  end, { desc = 'LuaSnip Backward Jump' })
  vim.keymap.set('i', '<C-l>', function()
    if ls.choice_active() then
      ls.change_choice(1)
    end
  end, { desc = 'LuaSnip Next Choice' })
  --]]

  require("luasnip.loaders.from_lua").lazy_load()

  -- Load VSCode-style snippets
  local status_ok, loader = pcall(require, "luasnip/loaders/from_vscode")
  if not status_ok then
    return
  end

  local user_settings = require("core.utils").user_plugin_opts("luasnip", {})
  if user_settings.vscode_snippet_paths ~= nil then
    loader.load { paths = user_settings.vscode_snippet_paths, exclude = { "latex", "lua", "markdown" } }
  else
    loader.load { exclude = { "latex", "lua", "markdown" } }
  end

  -- vim.api.nvim_add_user_command('LuaSnipEdit', edit_ft, {})
end
