local function augroup(name)
	return vim.api.nvim_create_augroup(name, { clear = true })
end

-- highlight on yank
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	group = augroup("highlight_yank"),
	callback = function()
		vim.highlight.on_yank({ higroup = "Search", timeout = 200 })
	end,
})

-- opens non-text files in the default program instead of in Neovim
vim.api.nvim_create_autocmd("BufReadPost", {
	group = augroup("openFile"),
	pattern = { "*.jpeg", "*.jpg", "*.pdf", "*.png" },
	callback = function()
		vim.fn.jobstart("open '" .. vim.fn.expand("%") .. "'", { detach = true })
		vim.api.nvim_buf_delete(0, {})
	end,
	desc = "openFile",
})

-- automatically regenerate spell file after editing dictionary
vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "*/spell/*.add",
	callback = function()
		vim.cmd.mkspell({ "%", bang = true, mods = { silent = true } })
	end,
})

-- Restore cursor last position
-- vim.api.nvim_create_autocmd("BufReadPost", {
-- 	group = augroup("last_loc"),
-- 	callback = function()
-- 		local mark = vim.api.nvim_buf_get_mark(0, '"')
-- 		local lcount = vim.api.nvim_buf_line_count(0)
-- 		if mark[1] > 0 and mark[1] <= lcount then
-- 			pcall(vim.api.nvim_win_set_cursor, 0, mark)
-- 		end
-- 	end,
-- })

-- Json comment function
-- vim.cmd("au! BufRead,BufNewFile *.json set filetype=jsonc")

-- Use 'q' to quit from common plugins
-- vim.api.nvim_create_autocmd({ "FileType" }, {
-- 	group = augroup("close_with_q"),
-- 	pattern = { "qf", "help", "notify", "spectre_panel" },
-- 	callback = function()
-- 		vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = true })
-- 		vim.opt_local.buflisted = false
-- 	end,
-- })

-- Set wrap & spell in markdown and gitcommit
-- vim.api.nvim_create_autocmd({ "FileType" }, {
-- 	group = augroup("wrap_spell"),
-- 	pattern = { "gitcommit", "markdown", "conf" },
-- 	callback = function()
-- 		vim.opt_local.wrap = true
-- 		vim.opt_local.spell = true
-- 	end,
-- })

-- Disable the concealing in some files
-- vim.api.nvim_create_autocmd("FileType", {
-- 	group = augroup("concealing_means_hidden"),
-- 	pattern = { "json", "jsonc", "markdown" },
-- 	callback = function()
-- 		vim.opt.conceallevel = 0
-- 	end,
-- })

-- Don't auto comment new lines
-- vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
-- 	group = augroup("very_useful"),
-- 	callback = function()
-- 		vim.cmd("set formatoptions-=cro")
-- 	end,
-- })
