return {
  servers = {
    "clangd",
    "pyright",
    "sumneko_lua",
    "texlab",
  },
  skip_setup = { "clangd" },
  ["server-settings"] = {
    clangd = { capabilities = { offsetEncoding = "utf-8" } },
    pyright = {
      settings = {
        python = {
          analysis = {
            typeCheckingMode = "on",
          },
        },
      },
    },
    texlab = {
      settings = {
        texlab = {
          build = { onSave = true },
          forwardSearch = {
            executable = "zathura",
            args = { "--synctex-forward", "%l:1:%f", "%p" },
          },
        },
      },
    },
  }
}
