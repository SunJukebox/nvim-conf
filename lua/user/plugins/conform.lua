return {
	"conform.nvim",
	event = "BufWritePre",
	after = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				nix = { "nixfmt" },
				markdown = { "prettierd", "markdownlint-cli2" },
				svelte = { "prettierd" },
				ts = { "prettierd" },
				js = { "prettierd" },
				yaml = { "prettierd" },
				tex = { "tex-fmt" },
			},
		})

		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function(args)
				require("conform").format({
					bufnr = args.buf,
					timeout_ms = 500,
					lsp_format = "fallback",
				})
			end,
		})
	end,
}
