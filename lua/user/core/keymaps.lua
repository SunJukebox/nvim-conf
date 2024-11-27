-- local function keymap(mode, lhs, rhs, opts)
-- 	opts = opts or {}
-- 	opts.silent = opts.silent ~= false
--   opts.noremap = opts.noremap ~= false
-- 	vim.keymap.set(mode, lhs, rhs, opts)
-- end
-- local opts = { noremap = true, silent = true }

-- Space as leader key
vim.keymap.set("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " " -- meant for a specific buffer, you generally use it based on a filetype

-- Update
-- vim.keymap.set("n", "<leader>u", function()
-- 	vim.fn.system("git clone --depth=1 https://github.com/sayanta01/nvim ~/.config/nvim")
-- 	vim.api.nvim_echo({ { "Repository cloned successfully!", "Normal" } }, true, {})
-- end, { desc = "Update" })

-- Keeping it centered
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "NNzzv")
vim.keymap.set("n", "}", "}zzzv")
vim.keymap.set("n", "{", "{zzzv")
vim.keymap.set("n", "J", "mzJ`z")

-- Move to window using the <ctrl> hjkl keys
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to window below" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to window above" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Resize window using <ctrl> arrow keys
vim.keymap.set("n", "<C-Up>", "<cmd>resize -2<CR>")
vim.keymap.set("n", "<C-Down>", "<cmd>resize +2<CR>")
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<CR>")
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<CR>")

-- Navigate buffers
vim.keymap.set("n", "[b", "<cmd>bprevious<CR>", { desc = "Prev. [B]uffer" })
vim.keymap.set("n", "]b", "<cmd>bnext<CR>", { desc = "Next [B]uffer" })
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<CR>", {desc = "Delete Buffer"})
-- keymap("n", "<S-Left>", "<cmd>BufferLineMovePrev<CR>", { desc = "Move buffer behind" })
-- keymap("n", "<S-Right>", "<cmd>BufferLineMoveNext<CR>", { desc = "Move buffer ahead" })

-- Delete not cut
-- keymap("n", "dd", '"_dd', opts)
-- keymap("n", "x", '"_x', opts)

-- Paste without overwriting register
vim.keymap.set({ "v", "x" }, "p", '"_dP')

-- Replace word under cursor across entire buffer
vim.keymap.set("n", "<leader>rp", [[<cmd>%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace across entire buffer" })

-- Clear search with <Esc>
vim.keymap.set({ "i", "n" }, "<Esc>", "<cmd>noh<CR><Esc>", { desc = "Escape for clear hlsearch" })

-- Increment/decrement
vim.keymap.set("n", "+", "<C-a>")
vim.keymap.set("n", "-", "<C-x>")

-- Splits
vim.keymap.set("n", "<leader>\\", "<cmd>vsplit<CR>", { desc = "Vert. Split" })
vim.keymap.set("n", "<leader>-", "<cmd>split<CR>", { desc = "Horiz. Split" })

-- Exit insert mode with jk
-- keymap("i", "jk", "<Esc>", opts)

-- Toggle terminal
vim.keymap.set("n", "<A-\\>", "<cmd>ToggleTerm<CR>")

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
vim.keymap.set("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next search result" })
vim.keymap.set("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
vim.keymap.set("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
vim.keymap.set("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev search result" })
vim.keymap.set("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
vim.keymap.set("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

-- Better up/down
vim.keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move text up/down
vim.keymap.set("n", "<M-D-j>", "<cmd>m .+1<CR>==")
vim.keymap.set("n", "<M-D-k>", "<cmd>m .-2<CR>==")
vim.keymap.set("i", "<M-D-j>", "<Esc><cmd>m .+1<CR>==gi")
vim.keymap.set("i", "<M-D-k>", "<Esc><cmd>m .-2<CR>==gi")
vim.keymap.set("v", "<M-D-j>", "<cmd>m '>+1<CR>gv=gv")
vim.keymap.set("v", "<M-D-k>", "<cmd>m '<-2<CR>gv=gv")

vim.keymap.set("n", "<leader>e", "<cmd>Lexplore<CR>")
