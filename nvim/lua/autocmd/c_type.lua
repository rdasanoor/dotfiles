local au = vim.api.nvim_create_autocmd

au("BufEnter", {
	pattern = "*.c0,*.c1,*.c,*.cpp,*.h",
	callback = function()
		-- Buffer Options
		vim.bo.cindent = true
		vim.bo.tabstop = 4
		vim.bo.shiftwidth = 4
	end,
})
