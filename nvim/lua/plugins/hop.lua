local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

require("hop").setup({})

map("n", "gw", "<Cmd>HopWord<CR>", opts)
map("v", "gw", "<Cmd>HopWord<CR>", opts)
map("n", "gco", "<Cmd>HopChar1<CR>", opts)
map("v", "gco", "<Cmd>HopChar1<CR>", opts)
map("n", "gct", "<Cmd>HopChar2<CR>", opts)
map("v", "gct", "<Cmd>HopChar2<CR>", opts)
map("n", "gp", "<Cmd>HopPattern<CR>", opts)
map("v", "gp", "<Cmd>HopPattern<CR>", opts)
map("n", "ga", "<Cmd>HopAnywhere<CR>", opts)
map("v", "ga", "<Cmd>HopAnywhere<CR>", opts)
