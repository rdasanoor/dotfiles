local au = vim.api.nvim_create_autocmd

au("TermOpen", {
	pattern = "*",
	callback = function()
		vim.wo.relativenumber = false
	end,
})

au("BufEnter", {
	pattern = "*",
	callback = function()
		vim.opt.fillchars = { eob = " ", vert = " ", fold = " " }
	end,
})

-- au("BufWritePre", {
-- 	pattern = "*",
-- 	command = "Neoformat",
-- })

vim.cmd([[
    autocmd BufWinLeave * silent! mkview
    autocmd BufWinEnter * silent! loadview
]])

require("autocmd/c_type")

require("autocmd/tex_au")

require("autocmd/html_au")

require("autocmd/asy_au")

require("autocmd/rb_au")

require("autocmd/sml_au")

require("autocmd/java_au")

require("autocmd/lua_au")

require("autocmd/jts_au")

require("autocmd/json_au")

require("autocmd/css_au")

require("autocmd/m_au")
