return {
  "folke/which-key.nvim",
  event = "VimEnter",
  opts = {
    plugins = { spelling = true },
    defaults = {
      mode = { "n", "v" },
      ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
      ['<leader>d'] = { name = '[D]ocument / [D]ebug', _ = 'which_key_ignore' },
      ['<leader>e'] = { name = '[E]xplorer', _ = 'which_key_ignore' },
      ['<leader>l'] = { name = '[L]SP', _ = 'which_key_ignore' },
      ['<leader>p'] = {
        name = '[P]lugins',
        _ = 'which_key_ignore',
        l = { ":Lazy<cr>", "[L]azy" }
      },
      ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
      ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
      ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    wk.register(opts.defaults)
  end,
}
