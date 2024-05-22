local au = vim.api.nvim_create_autocmd

au("BufEnter", {
	pattern = "*.html",
	callback = function()
		-- Spellcheck
		vim.opt.spell = true
		vim.opt.spelllang = { "en_us" }
		vim.api.nvim_set_keymap("i", "<C-l>", "<c-g>u<Esc>[s1z=`]a<c-g>u", { noremap = true })
	end,
})
