return {
  n = {
    ["<C-f>"] = {
      [[<cmd>silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<cr><cr><cmd>redraw!<cr>]],
      desc = "Edit inkscape figure",
    },
  },
  i = {
    ["<C-f>"] = {
      [[<cmd>silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<cr><cr><cmd>w<cr>]],
    },
  },
}
