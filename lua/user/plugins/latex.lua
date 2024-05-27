return {
  {
    "mathjiajia/latex.nvim",
    ft = "tex",
    commit = "2d90afe",
    config = function()
      require("latex").setup({
        imaps = {
          add = {
            ["\\mathrm"] = {
              lhs = "R",
              leader = "#",
              wrap_char = true,
            },
          },
        },
        surrounds = {
          enabled = false,
          command = "c",
          environment = "e",
        },
      })
    end,
  },
}
