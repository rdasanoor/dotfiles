local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }

map("n", "<Leader>ff", "<cmd>Files<cr>", opt)
map("n", "<Leader>fa", "<cmd>Files ~<cr>", opt)
map("n", "<Leader>rg", "<cmd>Rg<cr>", opt)
map("n", "<Leader>ag", "<cmd>Ag<cr>", opt)
