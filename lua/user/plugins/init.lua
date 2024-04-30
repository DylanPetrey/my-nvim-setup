local fn = vim.fn
local lazypath = fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Install your plugins here
require("lazy").setup({
	"nvim-lua/plenary.nvim", -- Useful lua functions used by lots of plugins
	"windwp/nvim-autopairs", -- Autopairs, integrates with both cmp and treesitter
	"numToStr/Comment.nvim",
	"JoosepAlviste/nvim-ts-context-commentstring",
	"kyazdani42/nvim-web-devicons",
	"moll/vim-bbye",
	"akinsho/toggleterm.nvim",
	"lewis6991/impatient.nvim",
	{ "lukas-reineke/indent-blankline.nvim", version = "2.20.8" },
	"folke/which-key.nvim",

	require("user.plugins.alpha"),
	require("user.plugins.bufferline"),
	require("user.plugins.cmp"),
	require("user.plugins.neo-tree"),
	require("user.plugins.gitsigns"),
	require("user.plugins.lualine"),
	require("user.plugins.project"),
	require("user.plugins.telescope"),

	-- Colorschemes
	"folke/tokyonight.nvim",
	"lunarvim/darkplus.nvim",

	-- Snippets
	"L3MON4D3/LuaSnip", --snippet engine
	"rafamadriz/friendly-snippets", -- a bunch of snippets to use

	-- LSP
	"neovim/nvim-lspconfig", -- enable LSP
	"williamboman/mason.nvim", -- simple to use language server installer
	"williamboman/mason-lspconfig.nvim",
	"jose-elias-alvarez/null-ls.nvim", -- for formatters and linters
	"RRethy/vim-illuminate",

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
})
