local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }

require("telescope").load_extension("fzf")
require("telescope").load_extension("file_browser")

map(
	"n",
	"<Leader>b",
	[[<cmd>lua require('telescope.builtin').buffers()<CR>]],
	opt
)
map(
	"n",
	"<Leader>fr",
	[[<cmd>lua require('telescope.builtin').oldfiles()<CR>]],
	opt
)
map(
	"n",
	"<Leader>fc",
	[[<cmd>lua require('telescope.builtin').commands()<CR>]],
	opt
)
map(
	"n",
	"<Leader>fb",
	[[:Telescope file_browser path=%:p:h select_buffer=true<CR>]],
	opt
)
map(
	"n",
	"<Leader>fh",
	[[<cmd>lua require('telescope.builtin').help_tags()<CR>]],
	opt
)

-- local builtin = require("telescope.builtin")

-- vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
-- vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
-- vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
-- vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
