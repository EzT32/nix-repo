local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Leader key is set in options.lua

-- File explorer / basic commands
map("n", "<leader>w", "<cmd>w<cr>", opts)          -- Save
map("n", "<leader>q", "<cmd>q<cr>", opts)          -- Quit
map("n", "<leader>h", "<cmd>nohlsearch<cr>", opts) -- Clear search highlight

-- Window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Buffer navigation
map("n", "<S-l>", ":bnext<CR>", opts) -- Next buffer
map("n", "<S-h>", ":bprevious<CR>", opts) -- Previous buffer
map("n", "<leader>bd", ":bdelete<CR>", opts) -- Delete current buffer

-- Telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)
