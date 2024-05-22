local au = vim.api.nvim_create_autocmd

au("BufEnter", {
	pattern = "*.rb",
	callback = function()
		-- Buffer options
		vim.bo.tabstop = 2
		vim.bo.shiftwidth = 2
	end,
})
