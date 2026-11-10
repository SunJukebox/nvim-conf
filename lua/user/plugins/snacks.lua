local keymap = require("lz.n").keymap({ "snacks.nvim" })

return {
	"snacks.nvim",
	after = function()
		require("snacks").setup({
			bigfile = { enabled = true },
			dashboard = {
				enabled = true,
				preset = {
					keys = {
						{
							icon = " ",
							key = "f",
							desc = "[F]ind file",
							action = ":lua Snacks.dashboard.pick('files')",
						},
						{ icon = " ", key = "n", desc = "[N]ew file", action = ":ene | startinsert" },
						{
							icon = " ",
							key = "g",
							desc = "[G]rep text",
							action = ":lua Snacks.dashboard.pick('live_grep')",
						},
						{
							icon = " ",
							key = "r",
							desc = "[R]ecent files",
							action = ":lua Snacks.dashboard.pick('oldfiles')",
						},
						{ icon = " ", key = "s", desc = "restore [S]ession", section = "session" },
						{ icon = " ", key = "q", desc = "[Q]uit", action = ":qa" },
					},
				},

				sections = {
					{ section = "header" },
					{ section = "keys", padding = 1 },
					{ section = "recent_files", title = "recent files", padding = 1 },
					{
						title = "git status",
						section = "terminal",
						enabled = function()
							return Snacks.git.get_root() ~= nil
						end,
						cmd = "git status --short --branch --renames",
						padding = 1,
						ttl = 5 * 60,
						indent = 3,
					},
				},
			},
			explorer = { enabled = true, replace_netrw = false },
			indent = { enabled = true },
			input = { enabled = true },
			picker = { enabled = true },
			notifier = { enabled = true },
			quickfile = { enabled = true },
			scope = { enabled = true },
			scroll = { enabled = true },
			statuscolumn = { enabled = true },
			words = { enabled = true },
			zen = { enabled = true, win = { backdrop = { transparent = false } } },
		})

		vim.api.nvim_buf_create_user_command(0, "Notifications", function()
			Snacks.notifier.show_history()
		end, { desc = "Shows the notification history" })
	end,

	-- explorer
	keymap.set("n", "<leader>e", function()
		Snacks.explorer()
	end, { desc = "File explorer" }),

	-- search
	keymap.set("n", "<leader>sf", function()
		Snacks.picker.smart()
	end, { desc = "[s]earch [f]iles" }),

	keymap.set("n", "<leader>sn", function()
		Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
	end, { desc = "[s]earch [n]eovim files" }),

	keymap.set("n", "<leader>sga", function()
		Snacks.picker.grep()
	end, { desc = "[s]earch [g]rep [a]ll" }),

	keymap.set("n", "<leader>sgb", function()
		Snacks.picker.lines()
	end, { desc = "[s]earch [g]rep [b]uffer" }),

	keymap.set("n", "<leader>sq", function()
		Snacks.picker.qflist()
	end, { desc = "[s]earch [q]uickfix" }),

	-- lsp
	keymap.set("n", "<leader>gdf", function()
		Snacks.picker.lsp_definitions()
	end, { desc = "[g]oto [d]efinition" }),

	-- keymap.set("n", "gD", function()
	-- 	Snacks.picker.lsp_declarations()
	-- end, { desc = "[g]oto [D]eclaration" }),

	keymap.set("n", "gr", function()
		Snacks.picker.lsp_references()
	end, { desc = "[g]oto [r]eferences", nowait = true }),

	keymap.set("n", "gi", function()
		Snacks.picker.lsp_implementations()
	end, { desc = "[g]oto [i]mplementation" }),

	keymap.set("n", "gt", function()
		Snacks.picker.lsp_type_definitions()
	end, { desc = "Goto [t]ype Definition" }),

	-- zen
	keymap.set("n", "<leader>tz", function()
		Snacks.zen()
	end, { desc = "Toggle [Z]en mode" }),
}
