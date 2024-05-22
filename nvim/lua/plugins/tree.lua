local map = vim.api.nvim_set_keymap

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

map("n", "<leader><leader>n", ":NvimTreeToggle<CR>", { silent = true })
map("n", "<leader><leader>r", ":NvimTreeRefresh<CR>", { silent = true })
map("n", "<leader><leader>c", ":NvimTreeCollapse<CR>", { silent = true })

require("nvim-tree").setup({})
