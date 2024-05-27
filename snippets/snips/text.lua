local conds_expand = require("luasnip.extras.conditions.expand")
local opts = { condition = conds_expand.line_begin }

local snips = {
  s({
      trig = "bk",
      name = "bookmark",
      desc = "Bookmark snippet for PDFtk",
      regTrig = true,
      hidden = true,
    },
    fmt(
      [[
			BookmarkBegin
			BookmarkTitle: {}
			BookmarkLevel: {}
			BookmarkPageNumber: {}
			]],
      { i(1), i(2), i(0) }
    ),
    opts
  ),
}

return snips
