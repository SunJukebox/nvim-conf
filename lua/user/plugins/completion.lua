local keymap = require("lz.n").keymap({ "luasnip" })

return {
  {
    "luasnip",
    event = "InsertEnter",
    before = function()
      vim.cmd.packadd("mySnippets")
    end,
    after = function()
      require("luasnip").setup({
        update_events = "TextChanged,TextChangedI",
        delete_check_events = "TextChanged",
        enable_autosnippets = true,
        store_selection_keys = "<Tab>",
        ext_opts = {
          [require("luasnip.util.types").insertNode] = { active = { virt_text = { { "", "Boolean" } } } },
          [require("luasnip.util.types").choiceNode] = { active = { virt_text = { { "󱥸", "Special" } } } },
        },
      })

      local snippet_paths = vim.api.nvim_get_runtime_file("snippets", true)
      require("luasnip.loaders.from_lua").lazy_load({ paths = snippet_paths })

      keymap.set({ "i", "s" }, "<C-;>", function() if require('luasnip').choice_active() then require('luasnip').change_choice(1) end end, { desc = "Change choice" })
    end,
  },
  {
    "blink.pairs",
    event = "InsertEnter",
    after = function()
      require("blink.pairs").setup({
        highlights = {
          groups = {
            "BlinkPairsOrange",
            "BlinkPairsPurple",
            "BlinkPairsBlue",
            "BlinkPairsCyan",
            "BlinkPairsYellow",
            "BlinkPairsGreen",
          },
        },
      })
    end,
  },
  {
    "blink-ripgrep",
    event = "InsertEnter"
  },
  {
    "blink.cmp",
    event = "InsertEnter",
    after = function()
      local source_dedup_priority = { "lsp", "path", "snippets", "buffer", "ripgrep" }
      local show_orig = require("blink.cmp.completion.list").show
      require("blink.cmp.completion.list").show = function(ctx, items_by_source)
        local seen = {}
        for _, source in ipairs(source_dedup_priority) do
          if items_by_source[source] then
            items_by_source[source] = vim.tbl_filter(function(item)
              local did_seen = seen[item.label]
              seen[item.label] = true
              return not did_seen
            end, items_by_source[source])
          end
        end
        return show_orig(ctx, items_by_source)
      end

      require("blink.cmp").setup({
        completion = {
          documentation = { auto_show = true },
          list = { max_items = 20 },
          menu = { draw = { treesitter = { "lsp" } } },
        },
        snippets = { preset = "luasnip" },
        sources = {
          default = { "lsp", "path", "snippets", "buffer", "ripgrep" },
          providers = {
            ripgrep = { module = "blink-ripgrep", name = "Ripgrep" },
            snippets = { opts = { show_autosnippets = false } },
          },
        },
      })
    end,
  }
}
