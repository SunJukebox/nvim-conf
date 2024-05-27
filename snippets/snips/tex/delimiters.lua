---@diagnostic disable: undefined-global
local autosnips = {}

local conds_expand = require("luasnip.extras.conditions.expand")
local tex = require("mySnippets.latex")
local get_visual = require("mySnippets.utils").get_visual

local brackets = {
	a = { "\\langle", "\\rangle" },
	-- A = { "Angle", "Angle" },
	b = { "[", "]" },
	-- B = { "Brack", "Brack" },
	c = { "{", "}" },
	m = { "|", "|" },
	p = { "(", ")" },
}

autosnips = {
	s(
		{
			trig = "lr([abcmp])",
			name = "left right",
			desc = "left right delimiters",
			regTrig = true,
			hidden = true,
			condition = tex.in_math,
			show_condition = tex.in_math,
		},
		fmta([[\left<> <>\right<><>]], {
			f(function(_, snip)
				local cap = snip.captures[1] or "p"
				return brackets[cap][1]
			end),
			d(1, get_visual),
			f(function(_, snip)
				local cap = snip.captures[1] or "p"
				return brackets[cap][2]
			end),
			i(0),
		})
	),

	s(
		{
			trig = "cvec",
			name = "column vector",
			hidden = true,
			condition = conds_expand.line_begin * tex.in_math,
		},
		fmta(
			[[
			\begin{pmatrix}
				<>_<> \\
				\vdots \\
				<>_<>
			\end{pmatrix}
			]],
			{ i(1, "x"), i(2, "1"), rep(1), i(3, "n") }
		)
	),
}

return nil, autosnips
