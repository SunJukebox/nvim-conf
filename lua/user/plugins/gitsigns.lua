local keymap = require("lz.n").keymap({ "gitsigns.nvim" })

return {
	"gitsigns.nvim",
	event = "DeferredUIEnter",
	after = function()
		require("gitsigns").setup({
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns
				-- navigation
				keymap.set("n", "]c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "]c", bang = true })
					else
						gs.nav_hunk("next")
					end
				end, { desc = "Jump to next git [c]hange", buf = bufnr })

				keymap.set("n", "[c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "[c", bang = true })
					else
						gs.nav_hunk("prev")
					end
				end, { desc = "Jump to previous git [c]hange", buf = bufnr })

				-- visual mode actions
				keymap.set("v", "<leader>hs", function()
					gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "git [s]tage hunk", buf = bufnr })
				keymap.set("v", "<leader>hs", function()
					gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "git [r]eset hunk" })
				-- normal mode actions
				keymap.set("n", "<leader>hs", gs.stage_hunk, { desc = "git [s]tage hunk", buf = bufnr })
				keymap.set("n", "<leader>hr", gs.reset_hunk, { desc = "git [r]eset hunk", buf = bufnr })
				keymap.set("n", "<leader>hS", gs.stage_buffer, { desc = "git [S]tage buffer", buf = bufnr })
				keymap.set("n", "<leader>hR", gs.reset_buffer, { desc = "git [R]eset buffer", buf = bufnr })
				keymap.set("n", "<leader>hp", gs.preview_hunk, { desc = "git [p]review hunk", buf = bufnr })
				keymap.set(
					"n",
					"<leader>hi",
					gs.preview_hunk_inline,
					{ desc = "git preview hunk [i]nline", buf = bufnr }
				)
				keymap.set("n", "<leader>hb", function()
					gs.blame_line({ full = true })
				end, { desc = "git [b]lame line", buf = bufnr })
				keymap.set("n", "<leader>hd", gs.diffthis, { desc = "git [d]iff against index", buf = bufnr })
				keymap.set("n", "<leader>hD", function()
					gs.diffthis("~")
				end, { desc = "git [D]iff against last commit", buf = bufnr })
				keymap.set("n", "<leader>hQ", function()
					gs.setqflist("all")
				end, { desc = "git hunk [Q]uickfix list (all files in repo)", buf = bufnr })
				keymap.set(
					"n",
					"<leader>hq",
					gs.setqflist,
					{ desc = "git hunk [q]uickfix list (all changes in this file)", buf = bufnr }
				)
				-- Toggles
				keymap.set(
					"n",
					"<leader>tb",
					gs.toggle_current_line_blame,
					{ desc = "[T]oggle git show [b]lame line", buf = bufnr }
				)
				keymap.set(
					"n",
					"<leader>tw",
					gs.toggle_word_diff,
					{ desc = "[T]oggle git intra-line [w]ord diff", buf = bufnr }
				)
				-- Text object
				keymap.set({ "o", "x" }, "ih", gs.select_hunk, { desc = "text object [i]nside [h]unk", buf = bufnr })
			end,
			signs = {
				add = { text = "│" },
				change = { text = "│" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "┆" },
			},
			signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
			numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
			linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
			word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
			watch_gitdir = {
				follow_files = true,
			},
			attach_to_untracked = true,
			current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
			current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
				delay = 1000,
				ignore_whitespace = false,
			},
			current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
			sign_priority = 6,
			update_debounce = 100,
			status_formatter = nil, -- Use default
			max_file_length = 40000, -- Disable if file is longer than this (in lines)
			preview_config = {
				-- Options passed to nvim_open_win
				style = "minimal",
				relative = "cursor",
				row = 0,
				col = 1,
			},
		})
	end,
}
