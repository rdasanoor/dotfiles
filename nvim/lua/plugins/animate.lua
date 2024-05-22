local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }

map("n", "<Up>", ":call animate#window_delta_height(4)<CR>", opt)
map("n", "<Down>", ":call animate#window_delta_height(-4)<CR>", opt)
map("n", "<Left>", ":call animate#window_delta_width(4)<CR>", opt)
map("n", "<Right>", ":call animate#window_delta_width(-4)<CR>", opt)
