vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "plugin_packer.lua",
	callback = function()
		vim.cmd([[PackerCompile]])
	end,
})
