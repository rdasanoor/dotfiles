require("treesitter-context").setup({
	trim_scope = "inner",
	max_lines = 5,
})

vim.keymap.set("n", "[c", function()
	require("treesitter-context").go_to_context()
end, { silent = true })
