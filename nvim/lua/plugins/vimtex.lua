local au = vim.api.nvim_create_autocmd

au("User", {
	pattern = "VimtexEventQuit",
	callback = function()
		vim.fn["vimtex#compiler#clean"](0)
	end,
})

vim.g.vimtex_quickfix_ignore_filters = {
	"Underfull",
	"Overfull",
	"No \author given",
}

vim.g.vimtex_syntax_conceal = {
	spacing = 0,
	math_bounds = 0,
	sections = 1,
}

vim.g.vimtex_quickfix_autoclose_after_keystrokes = 1

vim.g.vimtex_view_method = "skim"

vim.g.tex_flavor = "latex"
