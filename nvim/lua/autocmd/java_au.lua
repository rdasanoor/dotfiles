local au = vim.api.nvim_create_autocmd

au("BufEnter", {
	pattern = "*.java",
	callback = function()
		-- Buffer options
		vim.bo.tabstop = 4
		vim.bo.shiftwidth = 4
	end,
})
