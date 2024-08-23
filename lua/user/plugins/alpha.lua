return {
	"goolord/alpha-nvim",
	config = function()
		local dashboard = require("alpha.themes.dashboard")

		dashboard.section.header.val = {
			"  _____           _",
			" / ____|         | |",
			"| (___  _   _ ___| |_ ___ _ __ _____      ____ _ _ __ ___",
			" \\___ \\| | | / __| __/ _ \\ '_ ` _ \\ \\ /\\ / / _` | '__/ _ \\",
			" ____) | |_| \\__ \\ ||  __/ | | | | \\ V  V / (_| | | |  __/",
			"|_____/ \\__, |___/\\__\\___|_| |_| |_|\\_/\\_/ \\__,_|_|  \\___|",
			"        __/ |",
			"       |___/",
		}
		dashboard.section.buttons.val = {
			dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
			dashboard.button("a", "  New file", ":ene <BAR> <CR>"),
			dashboard.button("e", "  Open Explorer", ":Neotree toggle <CR>"),
			dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
			dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
			dashboard.button("t", "󱎸  Find text", ":Telescope live_grep <CR>"),
			dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
		}

		local function footer()
			-- NOTE: requires the fortune-mod package to work
			-- local handle = io.popen("fortune")
			-- local fortune = handle:read("*a")
			-- handle:close()
			-- return fortune
			return ""
		end

		dashboard.section.footer.val = footer()

		dashboard.section.footer.opts.hl = "Type"
		dashboard.section.header.opts.hl = "Include"
		dashboard.section.buttons.opts.hl = "Keyword"

		dashboard.opts.opts.noautocmd = true
		-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
		require('alpha').setup(dashboard.opts)
	end,
}
