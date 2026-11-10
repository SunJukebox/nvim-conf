return {
  "todo-comments",
  event = { "BufReadPre", "BufNewFile" },
  after = function()
    require("todo-comments").setup({})
  end,
}
