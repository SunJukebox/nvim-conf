return {
  {
    "mathjiajia/latex.nvim",
    dependencies = {
      "kylechui/nvim-surround"
    },
    ft = "tex",
    init = function()
      vim.g.latex_conf = {
        imaps = {
          enabled = true,
        },
        texlab = {
          enabled = true,
          build = "<leader>lb",
          forward = "<leader>ls"
        },
      }
    end,
  },
}
