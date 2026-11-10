local keymap = require("lz.n").keymap({ "which-key.nvim" })

return {
  {
    "which-key.nvim",
    after = function()
      require("which-key").setup()
    end,
    keymap.set("n", "<leader>?", function()
      require("which-key").show({ global = false })
    end, { desc = "Show buffer local keymaps" }),
  },
}
