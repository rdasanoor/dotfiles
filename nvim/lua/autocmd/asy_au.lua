local au = vim.api.nvim_create_autocmd

au("BufEnter", {
	pattern = "*.asy",
	callback = function()
		-- Buffer Options
		vim.bo.cindent = true
		vim.bo.tabstop = 4
		vim.bo.shiftwidth = 4
	end,
})
