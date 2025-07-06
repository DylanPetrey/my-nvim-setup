local personal = {
	{
		" _____        _               _____     _                  ",
		"|  __ \\      | |             |  __ \\   | |                 ",
		"| |  | |_   _| | __ _ _ __   | |__) |__| |_ _ __ ___ _   _ ",
		"| |  | | | | | |/ _` | '_ \\  |  ___/ _ \\ __| '__/ _ \\ | | |",
		"| |__| | |_| | | (_| | | | | | |  |  __/ |_| | |  __/ |_| |",
		"|_____/ \\__, |_|\\__,_|_| |_| |_|   \\___|\\__|_|  \\___|\\__, |",
		"         __/ |                                        __/ |",
		"        |___/                                        |___/ ",
	},
	{
		" ______  _     _ _____        ______       _______  _____  _______ _______ _______ _     _ _____ __   _  ______",
		" |_____] |     |   |   |      |     \\      |______ |     | |  |  | |______    |    |_____|   |   | \\  | |  ____",
		" |_____] |_____| __|__ |_____ |_____/      ______| |_____| |  |  | |______    |    |     | __|__ |  \\_| |_____|",
		"                                                                                                               ",
		"            _____  _______  _____   _____         _______      _  _  _ _______ __   _ _______                  ",
		"           |_____] |______ |     | |_____] |      |______      |  |  | |_____| | \\  |    |                     ",
		"           |       |______ |_____| |       |_____ |______      |__|__| |     | |  \\_|    |                     ",
		"                                                                                                               ",
	},
}


local work = {
	{
			"  _____           _",
			" / ____|         | |",
			"| (___  _   _ ___| |_ ___ _ __ _____      ____ _ _ __ ___",
			" \\___ \\| | | / __| __/ _ \\ '_ ` _ \\ \\ /\\ / / _` | '__/ _ \\",
			" ____) | |_| \\__ \\ ||  __/ | | | | \\ V  V / (_| | | |  __/",
			"|_____/ \\__, |___/\\__\\___|_| |_| |_|\\_/\\_/ \\__,_|_|  \\___|",
			"        __/ |",
			"       |___/",
	}
}


return {
	"goolord/alpha-nvim",
	config = function()
		local dashboard = require("alpha.themes.dashboard")

		local isWork = false
		local options = personal
		if isWork == true then options = work end

		-- pick random option
		math.randomseed(os.time())
		dashboard.section.header.val = options[math.random(#options)]

		dashboard.section.buttons.val = {
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
