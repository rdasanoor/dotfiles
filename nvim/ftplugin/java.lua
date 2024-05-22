local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local workspace_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

local config = {
	cmd = {
		"java",
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.level=ALL",
		"-Xmx1G",
		"-jar",
		vim.fn.glob(
			"/opt/homebrew/Cellar/jdtls/*/libexec/plugins/org.eclipse.equinox.launcher_*.jar"
		),
		"-configuration",
		vim.fn.glob("/opt/homebrew/Cellar/jdtls/*/libexec/config_mac"),
		"-data",
		vim.fn.expand("~/.cache/jdtls-workspace") .. workspace_dir,
	},

	root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" }),
	capabilities = capabilities,
}

require("jdtls").start_or_attach(config)

local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap(
	"n",
	"gD",
	"<cmd>lua vim.lsp.buf.declaration()<CR>",
	opts
)
vim.api.nvim_set_keymap(
	"n",
	"gd",
	"<cmd>lua vim.lsp.buf.definition()<CR>",
	opts
)
vim.api.nvim_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
vim.api.nvim_set_keymap(
	"n",
	"gi",
	"<cmd>lua vim.lsp.buf.implementation()<CR>",
	opts
)
vim.api.nvim_set_keymap(
	"n",
	"<C-k>",
	"<cmd>lua vim.lsp.buf.signature_help()<CR>",
	opts
)
vim.api.nvim_set_keymap(
	"n",
	"<space>wa",
	"<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>",
	opts
)
vim.api.nvim_set_keymap(
	"n",
	"<space>wr",
	"<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>",
	opts
)
vim.api.nvim_set_keymap(
	"n",
	"<space>wl",
	"<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
	opts
)
vim.api.nvim_set_keymap(
	"n",
	"<space>D",
	"<cmd>lua vim.lsp.buf.type_definition()<CR>",
	opts
)
vim.api.nvim_set_keymap(
	"n",
	"<space>rn",
	"<cmd>lua vim.lsp.buf.rename()<CR>",
	opts
)
vim.api.nvim_set_keymap(
	"n",
	"<space>ca",
	"<cmd>lua vim.lsp.buf.code_action()<CR>",
	opts
)
vim.api.nvim_set_keymap(
	"n",
	"gr",
	"<cmd>TroubleToggle lsp_references<CR>",
	opts
)
vim.api.nvim_set_keymap(
	"n",
	"<space>e",
	"<cmd>lua vim.diagnostic.open_float()<CR>",
	opts
)
vim.api.nvim_set_keymap(
	"n",
	"[d",
	"<cmd>lua vim.diagnostic.goto_prev()<CR>",
	opts
)
vim.api.nvim_set_keymap(
	"n",
	"]d",
	"<cmd>lua vim.diagnostic.goto_next()<CR>",
	opts
)
vim.api.nvim_set_keymap(
	"n",
	"<space>q",
	"<cmd>lua vim.diagnostic.setloclist()<CR>",
	opts
)
vim.api.nvim_set_keymap(
	"n",
	"<space>f",
	"<cmd>lua vim.lsp.buf.formatting()<CR>",
	opts
)
