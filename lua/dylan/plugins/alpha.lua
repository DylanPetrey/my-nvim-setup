return {
				"goolord/alpha-nvim",
				event = "VimEnter",
				config =  function()
								local alpha = require("alpha")
								local dashboard = require("alpha.themes.dashboard")

								-- Set header
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

								-- Set menu
								dashboard.section.buttons.val = {
												dashboard.button("e", "  > New File", "<cmd>ene<CR>"),
												dashboard.button("SPC ee", "  > Toggle file explorer", "<cmd>NvimTreeToggle<CR>"),
												dashboard.button("SPC ff", "󰱼 > Find File", "<cmd>Telescope find_files<CR>"),
												dashboard.button("SPC fs", "  > Find Word", "<cmd>Telescope live_grep<CR>"),
												dashboard.button("SPC wr", "󰁯  > Restore Session For Current Directory", "<cmd>SessionRestore<CR>"),
												dashboard.button("q", " > Quit NVIM", "<cmd>qa<CR>"),
								}

								-- Send config to alpha
								alpha.setup(dashboard.opts)

								-- Disable folding on alpha buffer
								vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
				end,
}
