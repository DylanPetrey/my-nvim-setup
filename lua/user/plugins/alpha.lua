return {
	"goolord/alpha-nvim",
	config = function()
		local dashboard = require("alpha.themes.dashboard")

		dashboard.section.header.val = {
			"  __  __       _           ____                       _   _     _              ",
			" |  \\/  | __ _| | _____   / ___|  ___  _ __ ___   ___| |_| |__ (_)_ __   __ _  ",
			" | |\\/| |/ _` | |/ / _ \\  \\___ \\ / _ \\| '_ ` _ \\ / _ \\ __| '_ \\| | '_ \\ / _` | ",
			" | |  | | (_| |   <  __/   ___) | (_) | | | | | |  __/ |_| | | | | | | | (_| | ",
			" |_|  |_|\\__,_|_|\\_\\___|  |____/ \\___/|_| |_| |_|\\___|\\__|_| |_|_|_| |_|\\__, | ",
			"                                                                        |___/  ",
			"            ____                  _       __        __          _              ",
			"           |  _ \\ ___  ___  _ __ | | ___  \\ \\      / /_ _ _ __ | |_            ",
			"           | |_) / _ \\/ _ \\| '_ \\| |/ _ \\  \\ \\ /\\ / / _` | '_ \\| __|           ",
			"           |  __/  __/ (_) | |_) | |  __/   \\ V  V / (_| | | | | |_            ",
			"           |_|   \\___|\\___/| .__/|_|\\___|    \\_/\\_/ \\__,_|_| |_|\\__|           ",
			"                           |_|                                                 ",
		}
		dashboard.section.buttons.val = {
			dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
			dashboard.button("a", "  New file", ":ene <BAR> <CR>"),
			dashboard.button("e", "  Open Explorer", ":Neotree toggle <CR>"),
			dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
			dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
			dashboard.button("t", "󱎸  Find text", ":Telescope live_grep <CR>"),
			dashboard.button("c", "  Configuration", ":e $MYVIMRC <CR>"),
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
