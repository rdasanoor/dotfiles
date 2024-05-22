require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"c",
		"cpp",
		"python",
		"lua",
		"bash",
		"java",
		"toml",
		"vim",
		"rust",
		"jsonc",
	},
	highlight = {
		enable = true,
		use_languagetree = true,
		disable = { "latex", "html" },
	},
	indent = { enable = true },
})
