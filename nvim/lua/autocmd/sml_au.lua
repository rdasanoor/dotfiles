local map = vim.api.nvim_buf_set_keymap
local au = vim.api.nvim_create_autocmd
local opt = { noremap = true, silent = true }

au("BufEnter", {
	pattern = "*.sml",
	callback = function()
		-- Buffer Options
		map(0, "n", "gd", ":SMLJumpToDef<CR>", opt)
		map(0, "n", "<leader>is", ":SMLReplStart<CR>", opt)
		map(0, "n", "<leader>ik", ":SMLReplStop<CR>", opt)
		map(0, "n", "<leader>ib", ":SMLReplBuild<CR>", opt)
		map(0, "n", "<leader>io", ":SMLReplOpen<CR>", opt)
		map(0, "n", "<leader>iu", ":SMLReplUse<CR>", opt)
		map(0, "n", "<leader>ic", ":SMLReplClear<CR>", opt)
		map(0, "n", "<leader>ip", ":SMLReplPrintDepth<CR>", opt)
	end,
})
