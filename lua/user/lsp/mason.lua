-- mason UI (unchanged)
require("mason").setup({
	ui = {
		border = "none",
		icons = {
			package_installed = "󰄬",
			package_pending = "",
			package_uninstalled = "󰇚",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
})

-- 1. Configure mason-lspconfig for servers Mason *can* manage
require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"ts_ls",     -- or "ts_ls" if your mason/nvim-lspconfig combo supports it
		-- add whatever else you want Mason to install:
		-- "rust_analyzer",
		-- "clangd",
		-- etc.
		-- DO NOT put "gleam" here.
	},
	automatic_enable = true,   -- default; Mason will vim.lsp.enable() these
})

-- common opts you were applying everywhere
local common_opts = {
	on_attach = require("user.lsp.handlers").on_attach,
	capabilities = require("user.lsp.handlers").capabilities,
	settings = {},
}

-- 2. Extra config overrides for TypeScript, like you had
vim.lsp.config("tsserver", vim.tbl_deep_extend("force", {}, common_opts, {
	root_markers = { "package.json" },
	init_options = {
		preferences = {
			importModuleSpecifierPreference = "non-relative",
		},
	},
}))

-- 3. Gleam: set up manually, outside Mason
vim.lsp.config("gleam", vim.tbl_deep_extend("force", {}, common_opts, {
	-- cmd = { "gleam", "lsp" }, -- optional explicit command
}))

-- Mason will NOT auto-enable gleam because it's not a Mason server.
-- So you enable it yourself:
vim.lsp.enable("gleam")
