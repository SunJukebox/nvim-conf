local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({ { import = "user.plugins" }, { import = "user.plugins.lsp" } }, {
	-- install = {
	-- 	colorscheme = { "habamax" },
	-- },
	change_detection = {
		-- automatically check for config file changes and reload the ui
		notify = false,
	},
	-- ui = {
	-- 	border = "rounded",
	-- 	icons = {
	-- 		config = " ",
	-- 		event = "🗲 ",
	-- 		init = " ",
	-- 		import = " ",
	-- 		keys = "󰥻 ",
	-- 		plugin = " ",
	-- 		source = " ",
	-- 		start = "|>",
	-- 		task = " ",
	-- 		list = {
	-- 			"●",
	-- 			"",
	-- 			"",
	-- 			"‒",
	-- 		},
	-- 	},
	-- },
	performance = {
		-- cache = {
		-- 	enabled = true,
		-- },
		rtp = {
			-- disable some rtp plugins
			disabled_plugins = {
				"gzip",
				"matchit",
				"matchparen",
				"netrwPlugin",
				"rplugin",
				"shada",
				"spellfile",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})
