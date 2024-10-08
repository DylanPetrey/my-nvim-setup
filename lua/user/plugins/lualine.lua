return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local status_ok, lualine = pcall(require, "lualine")
		if not status_ok then
			return
		end

		local hide_in_width = function()
			return vim.fn.winwidth(0) > 80
		end

		local lazy_status = require("lazy.status")

		local diagnostics = {
			"diagnostics",
			sources = { "nvim_diagnostic" },
			sections = { "error", "warn" },
			symbols = { error = " ", warn = " " },
			colored = false,
			update_in_insert = false,
			always_visible = true,
		}

		local diff = {
			"diff",
			colored = false,
			symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
			cond = hide_in_width,
		}

		local mode = {
			"mode",
			fmt = function(str)
				return "-- " .. str .. " --"
			end,
		}

		--local filetype = {
		--	"filetype",
		--	icons_enabled = false,
		--	icon = nil,
		--}

		local branch = {
			"branch",
			icons_enabled = true,
			icon = "",
		}

		local location = {
			"location",
			padding = 0,
		}

		-- local lsp = {
		-- 	-- Lsp server name .
		-- 	function()
		-- 		local msg = "No Active Lsp"
		-- 		local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
		-- 		local clients = vim.lsp.get_active_clients()
		-- 		if next(clients) == nil then
		-- 			return msg
		-- 		end
		-- 		for _, client in ipairs(clients) do
		-- 			local filetypes = client.config.filetypes
		-- 			if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
		-- 				return client.name
		-- 			end
		-- 		end
		-- 		return msg
		-- 	end,

		--local spaces = function()
		--	return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
		--end

		lualine.setup({
			options = {
				icons_enabled = true,
				theme = "auto",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
				always_divide_middle = true,
			},
			sections = {
				lualine_a = { branch, diagnostics },
				lualine_b = { mode },
				lualine_c = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ff9e64" },
					},
				},
				-- lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_x = { diff },
				lualine_y = { location },
				lualine_z = { "progress" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			extensions = {},
		})
	end,
}
