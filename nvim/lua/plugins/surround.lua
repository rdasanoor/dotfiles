require("surround").setup({
	mappings_style = "sandwich",
	pairs = {
		nestable = {
			b = { "(", ")" },
			s = { "[", "]" },
			B = { "{", "}" },
			a = { "<", ">" },
		},
		linear = { q = { "'", "'" }, t = { "`", "`" }, d = { '"', '"' } },
	},
})
