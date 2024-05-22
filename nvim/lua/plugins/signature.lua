local cfg = {
	floating_window = true, -- show hint in a floating window, set to false for virtual text only mode
	doc_lines = 0,
	hint_prefix = " ", -- Panda for parameter, NOTE: for the terminal not support emoji, might crash
	hint_scheme = "String",
	handler_opts = {
		border = "rounded", -- double, rounded, single, shadow, none, or a table of borders
	},
	extra_trigger_chars = { "(", "," }, -- Array of extra characters that will trigger signature completion, e.g., {"(", ","}
	padding = " ", -- character to pad on left and right of signature can be ' ', or '|'  etc
}

-- recommended:
require("lsp_signature").setup(cfg) -- no need to specify bufnr if you don't use toggle_key

local hl = vim.api.nvim_set_hl

hl(0, "LspSignatureActiveParameter", { bg = "NONE", fg = "red" })
