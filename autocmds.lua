vim.api.nvim_create_augroup("ink-sc", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  desc = "Run inkscape shortcut manager whenever LaTeX file is opened.",
  group = "ink-sc",
  pattern = "tex",
  callback = function() vim.fn.jobstart "python3 ~/.cache/build/inkscape-shortcut-manager/main.py" end,
})

vim.api.nvim_create_augroup("ink-fig", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  desc = "Inkscape figure watch",
  group = "ink-fig",
  pattern = "tex",
  callback = function() vim.fn.jobstart "inkscape-figures watch" end,
})
