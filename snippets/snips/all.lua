local username = vim.env.USER:gsub("^%l", string.upper)

local calculate_comment_string = require("Comment.ft").calculate
local utils = require("Comment.utils")

--- Get the comment string { beg,end } table
---@param ctype integer 1 for `line`-comment and 2 for `block`-comment
---@return table comment_strings { begcstring, endcstring }
local get_cstring = function(ctype)
	local cstring = calculate_comment_string({ ctype = ctype, range = utils.get_region() }) or vim.bo.commentstring
	local left, right = utils.unwrap_cstr(cstring)
	return { left, right }
end

--- Options for marks to be used in a TODO comment
local marks = {
	signature = function()
		return fmt("<{}>", i(1, username))
	end,
	date_signature = function()
		return fmt("<{}{}>", { i(1, os.date("%d-%m-%y")), i(2, ", " .. username) })
	end,
	date = function()
		return fmt("<{}>", i(1, os.date("%d-%m-%y")))
	end,
	empty = function()
		return t("")
	end,
}

local todo_snippet_nodes = function(aliases, opts)
	local aliases_nodes = vim.tbl_map(function(alias)
		return i(nil, alias) -- generate choices for [name-of-comment]
	end, aliases)
	local sigmark_nodes = {} -- choices for [comment-mark]
	for _, mark in pairs(marks) do
		table.insert(sigmark_nodes, mark())
	end
	-- format them into the actual snippet
	local comment_node = fmt("{} {}: {} {} {}{}", {
		f(function()
			return get_cstring(opts.ctype)[1] -- get <comment-string[1]>
		end),
		c(1, aliases_nodes), -- [name-of-comment]
		i(3), -- {comment-text}
		c(2, sigmark_nodes), -- [comment-mark]
		f(function()
			return get_cstring(opts.ctype)[2] -- get <comment-string[2]>
		end),
		i(0),
	})
	return comment_node
end

--- Generate a TODO comment snippet with an automatic description and docstring
---@param trig string
---@param aliases string[] of aliases for the todo comment (ex.: {FIX, ISSUE, FIXIT, BUG})
---@param opts table merged with the snippet opts table
local todo_snippet = function(trig, aliases, opts)
	opts = opts or {}
	opts.ctype = opts.ctype or 1

	local alias_string = table.concat(aliases, "|")

	local context = {
		trig = trig,
		name = alias_string .. " comment",
		desc = alias_string .. " comment with a signature-mark",
	}
	local comment_node = todo_snippet_nodes(aliases, opts)

	return s(context, comment_node, opts)
end

local base_specs = {
	todo = { "TODO" },
	fix = { "FIX", "BUG", "ISSUE", "FIXIT" },
	hack = { "HACK" },
	warn = { "WARN", "WARNING", "XXX" },
	perf = { "PERF", "PERFORMANCE", "OPTIM", "OPTIMIZE" },
	note = { "NOTE", "INFO" },
}

local todo_snippet_specs = {}
for k, v in pairs(base_specs) do
	todo_snippet_specs[k] = { v }
	todo_snippet_specs[k .. "b"] = { v, { ctype = 2 } }
end

local todo_comment_snippets = {}
for k, v in pairs(todo_snippet_specs) do
	table.insert(todo_comment_snippets, todo_snippet(k, v[1], v[2]))
end

return todo_comment_snippets
