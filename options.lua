return {
  g = {
    tex_flavor = "latex",
  },
  opt = {
    conceallevel = 2,
    foldenable = false,
    foldexpr = "nvim treesitter#foldexpr()", -- set Treesitter based folding
    foldmethod = "expr",
    linebreak = true, -- linebreak soft wrap at words
    -- list = true, -- show whitespace characters
    -- listchars = { tab = "│→", extends = "⟩", precedes = "⟨", trail = "·", nbsp = "␣" },
    shortmess = vim.opt.shortmess + { I = true },
    showbreak = "↪ ",
    spellfile = "~/.config/nvim/lua/user/spell/en.utf-8.add",
    -- thesaurus = "~/.config/nvim/lua/user/spell/mthesaur.txt",
    wrap = true, -- soft wrap lines
  },
}
