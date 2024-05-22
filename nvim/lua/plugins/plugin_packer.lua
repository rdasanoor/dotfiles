local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data")
		.. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({
			"git",
			"clone",
			"--depth",
			"1",
			"https://github.com/wbthomason/packer.nvim",
			install_path,
		})
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
	-- Plugin manager
	use({
		"wbthomason/packer.nvim",
		config = function()
			require("plugins/packern")
		end,
	})

	-- LSP
	use("neovim/nvim-lspconfig")

	use({
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	})

	use({
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup()
		end,
	})

	use("mfussenegger/nvim-jdtls")

	-- Latex
	use({
		"lervag/vimtex",
		config = function()
			require("plugins/vimtex")
		end,
	})

	-- UI
	use({
		"glepnir/dashboard-nvim",
		event = "VimEnter",
		config = function()
			require("dashboard").setup({})
		end,
		requires = { "nvim-tree/nvim-web-devicons" },
	})

	use({
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("plugins/indent_blankline")
		end,
	})

	use({
		"camspiers/animate.vim",
		config = function()
			require("plugins/animate")
		end,
	})

	use({
		"karb94/neoscroll.nvim",
		config = function()
			require("plugins/scroll")
		end,
	})

	use({
		"noib3/nvim-cokeline",
		requires = "nvim-tree/nvim-web-devicons",
		config = function()
			require("plugins/cokeline")
		end,
	})

	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
		config = function()
			require("plugins/lualine")
		end,
	})

	use({
		"nvim-tree/nvim-tree.lua",
		requires = "nvim-tree/nvim-web-devicons",
		config = function()
			require("plugins/tree")
		end,
	})

	use({
		"sbdchd/neoformat",
		config = function()
			require("plugins/format")
		end,
	})

	use("stevearc/dressing.nvim")

	use({
		"kevinhwang91/nvim-ufo",
		requires = "kevinhwang91/promise-async",
		config = function()
			require("plugins/ufo")
		end,
	})

	-- Icons
	use({
		"ziontee113/icon-picker.nvim",
		config = function()
			require("plugins/icons")
		end,
	})

	use({
		"nvim-tree/nvim-web-devicons",
		config = function()
			require("plugins/devicons")
		end,
	})

	-- Snippets
	use("honza/vim-snippets")

	use({
		"SirVer/ultisnips",
		config = function()
			require("plugins/ulti")
		end,
	})

	-- Auto-completion plugins
	use({
		"hrsh7th/nvim-cmp",
		config = function()
			require("plugins/cmp")
		end,
	})

	use("hrsh7th/cmp-nvim-lsp")

	use("hrsh7th/cmp-buffer")

	use("hrsh7th/cmp-path")

	use("hrsh7th/cmp-calc")

	use("hrsh7th/cmp-cmdline")

	use("quangnguyen30192/cmp-nvim-ultisnips")

	use("petertriho/cmp-git")

	use("onsails/lspkind.nvim")

	use("kdheepak/cmp-latex-symbols")

	use({
		"ray-x/lsp_signature.nvim",
		config = function()
			require("plugins/signature")
		end,
	})

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
			vim.cmd([[TSUpdate]])
		end,
		config = function()
			require("plugins/treesit")
		end,
	})

	use({
		"nvim-treesitter/nvim-treesitter-context",
		config = function()
			require("plugins/context")
		end,
	})

	-- Overlength
	use({
		"lcheylus/overlength.nvim",
		config = function()
			require("plugins/overlength")
		end,
	})

	-- Util
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("plugins/autopairs")
		end,
	})

	use({
		"phaazon/hop.nvim",
		branch = "v2", -- optional but strongly recommended
		config = function()
			require("plugins/hop")
		end,
	})

	--Fuzzy Finder
	use("nvim-lua/plenary.nvim")

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("plugins/telescope")
		end,
	})

	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "make",
	})

	use({
		"nvim-telescope/telescope-file-browser.nvim",
		requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	})

	use({
		"junegunn/fzf",
		run = ":call fzf#install()",
	})

	use({
		"junegunn/fzf.vim",
		config = function()
			require("plugins/fzf")
		end,
	})

	-- Spellcheck
	use({
		"lewis6991/spellsitter.nvim",
		config = function()
			require("plugins/spellsitter")
		end,
	})

	use("rhysd/vim-grammarous")

	-- Errors
	use({
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("plugins/trouble")
		end,
	})

	-- Comments
	use("tpope/vim-commentary")

	-- Surround
	use({
		"ur4ltz/surround.nvim",
		config = function()
			require("plugins/surround")
		end,
	})

	-- SML
	use("jez/vim-better-sml")

	-- Terminal
	use({
		"akinsho/toggleterm.nvim",
		tag = "*",
		config = function()
			require("plugins/term")
		end,
	})

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
