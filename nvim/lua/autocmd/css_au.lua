local au = vim.api.nvim_create_autocmd

au("BufEnter", {
	pattern = "*.css,*.scss,*.sass",
	callback = function()
		-- Buffer Options
		vim.bo.tabstop = 4
		vim.bo.shiftwidth = 4
	end,
})
