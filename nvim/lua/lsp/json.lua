local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require("lspconfig").jsonls.setup({
	on_attach = require("lsp/on_attach"),
	capabilities = capabilities,
})
