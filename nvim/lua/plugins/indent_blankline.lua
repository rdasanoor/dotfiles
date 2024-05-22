local highlight = {
	"Indent1",
	"Indent2",
	"Indent3",
	"Indent4",
	"Indent5",
	"Indent6",
}

local hooks = require("ibl.hooks")
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
	vim.api.nvim_set_hl(0, "Indent1", { fg = "#E06C75" })
	vim.api.nvim_set_hl(0, "Indent2", { fg = "#E5C07B" })
	vim.api.nvim_set_hl(0, "Indent3", { fg = "#98C379" })
	vim.api.nvim_set_hl(0, "Indent4", { fg = "#56B6C2" })
	vim.api.nvim_set_hl(0, "Indent5", { fg = "#61AFEF" })
	vim.api.nvim_set_hl(0, "Indent6", { fg = "#C678DD" })
end)

require("ibl").setup({
	indent = { highlight = highlight },
	scope = {
		enabled = false,
	},
	exclude = {
		filetypes = {
			"lspinfo",
			"packer",
			"checkhealth",
			"help",
			"man",
			"dashboard",
		},
	},
})
