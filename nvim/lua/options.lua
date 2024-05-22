vim.opt.hidden = true

vim.o.relativenumber = true

vim.o.number = false

vim.o.hls = false

vim.o.expandtab = true

vim.o.termguicolors = true

vim.o.laststatus = 3

vim.o.mouse = "a"

vim.g.mapleader = " "

-- Buffer Options
vim.bo.tabstop = 4

vim.bo.shiftwidth = 4

-- Highlighting
local hl = vim.api.nvim_set_hl

hl(0, "LineNR", { fg = "#404040" })

hl(0, "Conceal", { bold = true, fg = "#00FFFF", bg = "NONE" })

hl(0, "Type", { bold = true, fg = "#00FF80" })

hl(0, "Special", { fg = "#3399FF" })

hl(0, "Statement", { bold = true, fg = "#B266FF" })

hl(0, "Constant", { fg = "#FFCCFF" })

hl(0, "Todo", { fg = "#003EFF", bg = "#FFB367" })

hl(0, "Comment", { fg = "#9999FF" })

hl(0, "StatusLineNC", { fg = "#000000", bg = "#000000" })

hl(0, "Folded", { bg = "NONE" })

hl(0, "FoldColumn", { fg = "#E6E6E6", bg = "NONE" })

hl(0, "NormalFloat", { bg = "NONE" })

vim.opt.signcolumn = "number"

-- Conceal
vim.opt.concealcursor = "nc"

vim.opt.conceallevel = 2

-- Python
vim.g.python3_host_prog = "~/.config/nvim/Neovim/bin/python3"
