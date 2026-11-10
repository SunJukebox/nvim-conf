return {
	{
		"nvim-lspconfig",
		event = "DeferredUIEnter",
		-- set up our on_attach function once before the spec loads
		before = function()
			vim.lsp.config("*", {
				on_attach = function(_, bufnr)
					-- we create a function that lets us more easily define mappings specific
					-- for LSP related items. It sets the mode, buffer and description for us each time.
					local map = function(keys, func, desc, mode)
						mode = mode or "n"
						vim.keymap.set("n", keys, func, { buffer = bufnr, desc = "LSP: " .. desc })
					end

					map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
					map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })
					map("<leader>gdc", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
					map("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")

					-- See `:help K` for why this keymap
					map("K", vim.lsp.buf.hover, "Hover Documentation")
					map("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

					-- Lesser used LSP functionality
					map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
					map("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
					map("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
					map("<leader>wl", function()
						print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					end, "[W]orkspace [L]ist Folders")

					-- Create a command `:Format` local to the LSP buffer
					vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
						vim.lsp.buf.format()
					end, { desc = "Format current buffer with LSP" })
				end,
			})
		end,
		after = function()
			local servers = { "lua_ls", "texlab", "nixd", "pyright" }
			for _, lsp in pairs(servers) do
				vim.lsp.enable(lsp)
			end
		end,
	},
	-- {
	-- 	"mason.nvim",
	-- 	enabled = not nixInfo.isNix,
	-- 	priority = 100, -- <- run lsp hook before lspconfig's hook
	-- 	on_plugin = { "nvim-lspconfig" },
	-- 	lsp = function(plugin)
	-- 		vim.cmd.MasonInstall(plugin.name)
	-- 	end,
	-- },
	-- {
	-- 	-- lazydev makes your lua lsp load only the relevant definitions for a file.
	-- 	-- It also gives us a nice way to correlate globals we create with files.
	-- 	"lazydev.nvim",
	-- 	auto_enable = true,
	-- 	cmd = { "LazyDev" },
	-- 	ft = "lua",
	-- 	after = function(_)
	-- 		require("lazydev").setup({
	-- 			library = {
	-- 				{ words = { "nixInfo%.lze" }, path = nixInfo("lze", "plugins", "start", "lze") .. "/lua" },
	-- 				{
	-- 					words = { "nixInfo%.lze" },
	-- 					path = nixInfo("lzextras", "plugins", "start", "lzextras") .. "/lua",
	-- 				},
	-- 			},
	-- 		})
	-- 	end,
	-- },
}
