require("lspconfig").tsserver.setup({
	on_attach = require("lsp/on_attach"),
	root_dir = function()
		return vim.loop.cwd()
	end,
})
