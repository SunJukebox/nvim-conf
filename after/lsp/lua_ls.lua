local config = {
  filetypes = { "lua" },
  settings = {
    Lua = {
      signatureHelp = { enabled = true },
      diagnostics = {
        globals = { "nixInfo", "vim" },
        disable = { "missing-fields" },
      },
    },
  },
}

return config
