local config = {
	filetypes = { "nix" },
	settings = {
		nixd = {
			nixpkgs = {
				expr = [[import <nixpkgs> {}]],
			},
			options = {},
			formatting = {
				command = { "nixfmt" },
			},
			diagnostic = {
				suppress = {
					"sema-escaping-with",
				},
			},
		},
	},
}

return config
