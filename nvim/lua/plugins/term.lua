local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }

require("toggleterm").setup({
	size = function(term)
		if term.direction == "vertical" then
			return vim.o.columns * 0.4
		else
			return 15
		end
	end,
	open_mapping = [[<c-\>]],
	hide_numbers = true,
	float_opts = {
		border = "curved",
	},
	start_in_insert = true,
	insert_mappings = true,
	terminal_mappings = true,
})

map(
	"n",
	"<c-t>",
	[[<Cmd>exe v:count1 . "ToggleTerm direction=horizontal"<CR>]],
	opt
)
map("n", "<space>t", [[<Cmd>ToggleTerm direction=float<CR>]], opt)
map("n", ",t", [[<Cmd>ToggleTerm direction=tab<CR>]], opt)
map(
	"i",
	"<c-t>",
	[[<Esc><Cmd>exe v:count1 . "ToggleTerm direction=horizontal"<CR>]],
	opt
)

-- Lazygit
local Terminal = require("toggleterm.terminal").Terminal

local lazygit_tab = Terminal:new({
	cmd = "lazygit",
	hidden = true,
	direction = "tab",
	float_opts = {
		border = "curved",
	},
})

function _Lazygit_toggle_tab()
	lazygit_tab:toggle()
end

map("n", "<space>g", "<Cmd>lua _Lazygit_toggle_tab()<CR>", opt)

local lazygit_float = Terminal:new({
	cmd = "lazygit",
	hidden = true,
	direction = "float",
	float_opts = {
		border = "curved",
	},
})

function _Lazygit_toggle_float()
	lazygit_float:toggle()
end

map("n", "<leader>g", "<Cmd>lua _Lazygit_toggle_float()<CR>", opt)
