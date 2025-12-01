return {
  {
    "mathjiajia/latex.nvim",
    commit = "bfc0ef8",
    dependencies = {
      "kylechui/nvim-surround"
    },
    ft = "tex",
    init = function()
      vim.g.latex_conf = {
        imaps = {
          enabled = true,
        },
      }
    end,
  },
}
