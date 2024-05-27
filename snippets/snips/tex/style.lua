local snips, autosnips = {}, {}

local tex = require("mySnippets.latex")
local postfix_snippet = require("mySnippets.utils").postfix_snippet

snips = {
	s(
		{ trig = "bf", name = "bold", desc = "Insert bold text." },
		{ t("\\textbf{"), i(1), t("}") },
		{ condition = tex.in_text, show_condition = tex.in_text }
	),
	s(
		{ trig = "it", name = "italic", desc = "Insert italic text." },
		{ t("\\textit{"), i(1), t("}") },
		{ condition = tex.in_text, show_condition = tex.in_text }
	),
	s(
		{ trig = "em", name = "emphasize", desc = "Insert emphasize text." },
		{ t("\\emph{"), i(1), t("}") },
		{ condition = tex.in_text, show_condition = tex.in_text }
	),
}

autosnips = {
	s(
		{ trig = "tss", name = "text subscript", wordTrig = false, hidden = true },
		{ t("_{\\mathrm{"), i(1), t("}}") },
		{ condition = tex.in_math }
	),
	-- s(
	-- 	{ trig = '[^\\]"', name = 'Quotation', regTrig = true },
	-- 	{ t('``'), i(1), t "''" },
	-- 	{ condition = tex.in_text }
	-- ),
}

local postfix_math_specs = {
	mbb = {
		context = { name = "mathbb", desc = "math blackboard bold" },
		command = { pre = [[\mathbb{]], post = [[}]] },
	},
	mcal = {
		context = { name = "mathcal", desc = "math calligraphic" },
		command = { pre = [[\mathcal{]], post = [[}]] },
	},
	mscr = {
		context = { name = "mathscr", desc = "math script" },
		command = { pre = [[\mathscr{]], post = [[}]] },
	},
	mfr = {
		context = { name = "mathfrak", desc = "mathfrak" },
		command = { pre = [[\mathfrak{]], post = [[}]] },
	},
	hat = {
		context = { name = "hat", desc = "hat", priority = 500 },
		command = { pre = [[\widehat{]], post = [[}]] },
	},
	bar = {
		context = { name = "bar", desc = "bar (overline)", priority = 500 },
		command = { pre = [[\overline{]], post = [[}]] },
	},
	td = {
		context = { name = "tilde", desc = "tilde", priority = 500 },
		command = { pre = [[\widetilde{]], post = [[}]] },
	},
}

local postfix_math_snippets = {}
for k, v in pairs(postfix_math_specs) do
	table.insert(
		postfix_math_snippets,
		postfix_snippet(vim.tbl_deep_extend("keep", { trig = k }, v.context), v.command, { condition = tex.in_math })
	)
end
vim.list_extend(autosnips, postfix_math_snippets)

return snips, autosnips
