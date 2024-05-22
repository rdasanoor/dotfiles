local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }

require("trouble").setup()

map("n", "<leader>xx", "<cmd>TroubleToggle<cr>", opt)
map("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", opt)
map("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", opt)
map("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", opt)
map("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", opt)
map("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", opt)
