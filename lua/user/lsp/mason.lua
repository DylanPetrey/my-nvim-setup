local settings = {
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
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
	automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local opts = {}

lspconfig.gleam.setup({})

require("mason-lspconfig").setup({
	function(server)
		---@diagnostic disable-next-line: missing-parameter  From initial commit
		server = vim.split(server, "@")[1]

		opts = {
			on_attach = require("user.lsp.handlers").on_attach,
			capabilities = require("user.lsp.handlers").capabilities,
			settings = {},
		}

		local require_ok, conf_opts = pcall(require, "user.lsp.settings." .. server)
		if require_ok then
			opts = vim.tbl_deep_extend("force", conf_opts, opts)
		end

		if server == "tsserver" then
			opts.root_dir = lspconfig.util.root_pattern("package.json")
			opts.init_options = {
				preferences = {
					importModuleSpecifierPreference = "non-relative",
				},
			}
		end

		lspconfig[server].setup(opts)
	end

})
