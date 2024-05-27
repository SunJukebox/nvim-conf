return {
  "nvim-tree/nvim-tree.lua",
  cmd = "NvimTreeToggle",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Explorer NvimTree" },
  },
  opts = {
    hijack_cursor = false,
    on_attach = function(bufnr)
      local bufmap = function(keys, func, desc)
        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
      end

      -- :help nvim-tree.api
      local api = require('nvim-tree.api')

      api.config.mappings.default_on_attach(bufnr)

      bufmap('<C-t>', api.tree.change_root_to_parent, 'Change root to the parent folder')
      bufmap('?', api.tree.toggle_help, 'Open help menu')
      -- bufmap('L', api.node.open.edit, 'Expand folder or go to file')
      -- bufmap('H', api.node.navigate.parent_close, 'Close parent folder')
      -- bufmap('gh', api.tree.toggle_hidden_filter, 'Toggle hidden files')
    end
  }
}
