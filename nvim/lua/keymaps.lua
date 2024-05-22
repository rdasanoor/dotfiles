local map = vim.keymap.set
local opt = { noremap = true, silent = true }

map("i", "jk", "<Esc>", opt)

map(
	"i",
	"<C-f>",
	[[<Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/";inkscape-figures watch'<CR><CR>:w<CR>]],
	opt
)

map(
	"n",
	"<C-f>",
	[[: silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>]],
	opt
)

map("n", "<leader>w", [[:Neoformat<CR><CR>:w<CR>]])

map("n", "<ScrollWheelUp>", [[<C-Y>]], opt)
map("n", "<ScrollWheelDown>", [[<C-E>]], opt)
