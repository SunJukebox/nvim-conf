local cmp_ok, cmp = pcall(require, "cmp")
local luasnip_ok, luasnip = pcall(require, "luasnip")
if not cmp_ok or not luasnip_ok then
  return {}
end

return {
  mapping = {
    ["<CR>"] = cmp.mapping.confirm(),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if luasnip.expandable() then
        luasnip.expand()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
  },
}
