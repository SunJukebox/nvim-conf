return {
  "hrsh7th/nvim-cmp",
  event = { "CmdlineEnter", "InsertEnter" },
  dependencies = {
    -- Adds other completion capabilities.
    --  nvim-cmp does not ship with all sources by default. They are split
    --  into multiple repos for maintenance purposes.
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
    -- "hrsh7th/cmp-buffer",
    -- "f3fora/cmp-spell",
    "hrsh7th/cmp-calc",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    -- "rafamadriz/friendly-snippets",
  },
  config = function()
    -- See `:help cmp`
    local cmp = require('cmp')
    local luasnip = require('luasnip')

    local kind_icons = {
      Text = "",
      Method = "",
      Function = "ƒ",
      Constructor = "",
      Field = "",
      Variable = "",
      Class = "",
      Interface = "",
      Module = "󱒌",
      Property = "",
      Unit = "",
      Value = "󰎠",
      Enum = "ℰ",
      Keyword = "",
      Snippet = "",
      Color = "",
      File = "",
      Reference = "",
      Folder = "",
      EnumMember = "",
      Constant = "󰏿",
      Struct = "",
      Event = "🗲",
      Operator = "󰆕",
      TypeParameter = "",
    }

    cmp.setup {
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      completion = { completeopt = 'menu,menuone,noinsert' },

      -- For an understanding of why these mappings were
      -- chosen, you will need to read `:help ins-completion`
      --
      -- No, but seriously. Please read `:help ins-completion`, it is really good!
      mapping = cmp.mapping.preset.insert {
        -- Select the [n]ext item
        ['<C-n>'] = cmp.mapping.select_next_item(),
        -- Select the [p]revious item
        ['<C-p>'] = cmp.mapping.select_prev_item(),

        -- Accept ([y]es) the completion.
        --  This will auto-import if your LSP supports it.
        --  This will expand snippets if the LSP sent a snippet.
        ['<C-y>'] = cmp.mapping.confirm { select = true },

        -- Manually trigger a completion from nvim-cmp.
        --  Generally you don't need this, because nvim-cmp will display
        --  completions whenever it has completion options available.
        ['<C-Space>'] = cmp.mapping.complete {},

        -- Think of <c-o> as moving to the right of your snippet expansion.
        --  So if you have a snippet that's like:
        --  function $name($args)
        --    $body
        --  end
        --
        -- <c-o> will move you to the right of each of the expansion locations.
        -- <c-a> is similar, except moving you backwards.
        ['<C-o>'] = cmp.mapping(function()
          if luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          end
        end, { 'i', 's' }),
        ['<C-a>'] = cmp.mapping(function()
          if luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          end
        end, { 'i', 's' }),
      },
      sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' },
        { name = 'calc' },
      },
      -- Formatting
      formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
          -- vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
          vim_item.kind = string.format("%s", kind_icons[vim_item.kind], vim_item.kind) -- This concatenates the icons with the name of the item kind
          vim_item.menu = ({
            -- codeium = "[Codeium]",
            nvim_lsp = "[LSP]",
            luasnip = "[Snip]",
            -- buffer = "[Buf]",
            path = "[Path]",
            -- spell = "[Spell]",
            calc = "[Calc]",
            -- crates = "[Crates]",
          })[entry.source.name]

          -- Custom icons for source
          local custom_menu_icon = {
            -- codeium = "󱙺",
            calc = "󰆕",
            -- crates = "",
            -- codeium = "󱙺 Codeium",
            -- calc = "󰆕 Calc",
            -- crates = " Crates",
          }
          if entry.source.name == "codeium" then
            vim_item.kind = custom_menu_icon.codeium
          end
          if entry.source.name == "calc" then
            vim_item.kind = custom_menu_icon.calc
          end
          if entry.source.name == "crates" then
            vim_item.kind = custom_menu_icon.crates
          end
          return vim_item
        end,
      },
    }
  end,
}
