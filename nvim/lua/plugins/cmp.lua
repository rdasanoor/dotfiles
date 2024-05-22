local cmp = require("cmp")
local hl = vim.api.nvim_set_hl

---@diagnostic disable-next-line:redundant-parameter
cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			vim.fn["UltiSnips#Anon"](args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered({ col_offset = -3 }),
		-- completion = {
		-- 	winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
		-- 	col_offset = -3,
		-- 	side_padding = 0,
		-- },
		documentation = cmp.config.window.bordered(),
	},
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			local kind = require("lspkind").cmp_format({
				mode = "symbol_text",
				maxwidth = 50,
			})(entry, vim_item)

			local strings = vim.split(kind.kind, "%s", { trimempty = true })

			if entry.source.name == "calc" then
				kind.kind = " 󰃬 "
			else
				kind.kind = " " .. (strings[1] or "") .. " "
			end

			kind.menu = "    (" .. (strings[2] or "") .. ")"

			return kind
		end,
	},
	mapping = cmp.mapping.preset.insert({
		-- ["<S-Tab>"] = cmp.mapping.select_prev_item(),
		-- ["<Tab>"] = cmp.mapping.select_next_item(),
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "ultisnips" },
		{ name = "buffer" },
		{ name = "latex_symbols", option = { strategy = 2 } },
		{ name = "path" },
		{ name = "calc" },
	}),
})

-- Set configuration for specific filetype.
cmp.setup.filetype("gitcommit", {
	sources = cmp.config.sources({
		{ name = "git" },
		{ name = "buffer" },
	}),
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
		{ name = "cmdline" },
	}),
})

-- Set up lspconfig.
local lsp_defaults = require("lspconfig").util.default_config

lsp_defaults.capabilities = vim.tbl_deep_extend(
	"force",
	lsp_defaults.capabilities,
	require("cmp_nvim_lsp").default_capabilities()
)

-- If you want insert `(` after select function or method item
local cmp_autopairs = require("nvim-autopairs.completion.cmp")

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

-- Highlighting
hl(0, "PmenuSel", { bg = "#282C34", fg = "NONE" })
hl(0, "Pmenu", { fg = "#C5CDD9", bg = "#22252A" })

hl(
	0,
	"CmpItemAbbrDeprecated",
	{ fg = "#7E8294", bg = "NONE", strikethrough = true }
)
hl(0, "CmpItemAbbrMatch", { fg = "#82AAFF", bg = "NONE", bold = true })
hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#82AAFF", bg = "NONE", bold = true })
hl(0, "CmpItemMenu", { fg = "#C792EA", bg = "NONE", italic = true })

hl(0, "CmpItemKindField", { fg = "#B5585F" })
hl(0, "CmpItemKindProperty", { fg = "#B5585F" })
hl(0, "CmpItemKindEvent", { fg = "#B5585F" })

hl(0, "CmpItemKindText", { fg = "#9FBD73" })
hl(0, "CmpItemKindEnum", { fg = "#9FBD73" })
hl(0, "CmpItemKindKeyword", { fg = "#9FBD73" })

hl(0, "CmpItemKindConstant", { fg = "#D4BB6C" })
hl(0, "CmpItemKindConstructor", { fg = "#D4BB6C" })
hl(0, "CmpItemKindReference", { fg = "#D4BB6C" })

hl(0, "CmpItemKindFunction", { fg = "#A377BF" })
hl(0, "CmpItemKindStruct", { fg = "#A377BF" })
hl(0, "CmpItemKindClass", { fg = "#A377BF" })
hl(0, "CmpItemKindModule", { fg = "#A377BF" })
hl(0, "CmpItemKindOperator", { fg = "#A377BF" })

hl(0, "CmpItemKindVariable", { fg = "#7E8294" })
hl(0, "CmpItemKindFile", { fg = "#7E8294" })

hl(0, "CmpItemKindUnit", { fg = "#D4A959" })
hl(0, "CmpItemKindSnippet", { fg = "#D4A959" })
hl(0, "CmpItemKindFolder", { fg = "#D4A959" })

hl(0, "CmpItemKindMethod", { fg = "#6C8ED4" })
hl(0, "CmpItemKindValue", { fg = "#6C8ED4" })
hl(0, "CmpItemKindEnumMember", { fg = "#6C8ED4" })

hl(0, "CmpItemKindInterface", { fg = "#58B5A8" })
hl(0, "CmpItemKindColor", { fg = "#58B5A8" })
hl(0, "CmpItemKindTypeParameter", { fg = "#58B5A8" })
