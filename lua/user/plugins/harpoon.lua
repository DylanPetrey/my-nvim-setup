return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")

		harpoon:setup()

		vim.keymap.set("n", "<leader>he", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Menu" })

		vim.keymap.set("n", "<leader>ha", function()
			harpoon:list():Add()
		end, { desc = "Add File" })

		-- Toggle previous & next buffers stored within Harpoon list
		vim.keymap.set("n", "<leader>hh", function()
			harpoon:list():prev()
		end, { desc = "Prev File" })
		vim.keymap.set("n", "<leader>hl", function()
			harpoon:list():next()
		end, { desc = "Next File" })

		-- basic telescope configuration
		local conf = require("telescope.config").values
		local function toggle_telescope(harpoon_files)
			local file_paths = {}
			for _, item in ipairs(harpoon_files.items) do
				table.insert(file_paths, item.value)
			end

			require("telescope.pickers")
				.new({}, {
					prompt_title = "Harpoon",
					finder = require("telescope.finders").new_table({
						results = file_paths,
					}),
					previewer = conf.file_previewer({}),
					sorter = conf.generic_sorter({}),
				})
				:find()
		end

		vim.keymap.set("n", "<leader>ht", function()
			toggle_telescope(harpoon:list())
		end, { desc = "Telescope Harpoon Marks" })
	end,
}
