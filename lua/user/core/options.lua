-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Tabs & Indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true -- convert tabs to spaces

-- Line wrapping
vim.opt.wrap = false

-- Search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- opt.smartindent = true -- autoindent new lines

-- Split windows
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Info
vim.opt.showmode = false
vim.opt.showcmd = false

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Turn off swapfile
vim.opt.swapfile = false

vim.opt.confirm = true
vim.opt.cursorline = true
vim.opt.scrolloff = 6
vim.opt.sidescrolloff = 8
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time

-- Misc
vim.opt.guifont = "JetBrainsMono NF Thin:h15"
vim.opt.fileencoding = "utf-8"
vim.opt.writebackup = false -- disable making a backup before overwriting a file
vim.opt.backup = false -- creates a backup file
-- opt.hidden = true -- required to keep multiple buffers and open multiple buffers
vim.opt.undofile = true -- enable persistent undo
vim.opt.updatetime = 180 -- interval for writing swap file to disk, also used by gitsigns
vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- Folding using treesitter
vim.opt.foldlevel = 20
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

--- Settings
vim.opt.spelllang:append("cjk") -- Disable spellchecking for asian characters (VIM algorithm does not support it)
vim.opt.shortmess:append("c") -- Don't show redundant messages from ins-completion-menu
vim.opt.whichwrap:append("<,>,[,],h,l")

-- Disable some default providers
for _, provider in ipairs({ "node", "perl", "python3", "ruby" }) do
	vim.g["loaded_" .. provider .. "_provider"] = 0
end

-- Latex
vim.g.tex_flavor = "latex"
