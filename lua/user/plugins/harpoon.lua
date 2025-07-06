return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { 
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim", -- optional
	},
	config = function()
		local harpoon = require("harpoon")

		-- REQUIRED
		harpoon:setup()
		-- REQUIRED

		vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end, { desc = "Add File" })
		vim.keymap.set("n", "<leader>he", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,  { desc = "Edit" })
		vim.keymap.set("n", "<leader>hs", "<cmd>Telescope harpoon marks<cr>", { desc = "Search Marks" }) 

		vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
		vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
		vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
		vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)

		-- Toggle previous & next buffers stored within Harpoon list
		vim.keymap.set("n", "<leader>hn", function() harpoon:list():next() end, { desc = "Nav Next"})
		vim.keymap.set("n", "<leader>hp", function() harpoon:list():prev() end, { desc = "Nav Prev"})


		-- for i = 1, 9 do
		-- 	keymap("n", "<leader>" .. i, string.format('<cmd>:lua require("harpoon.ui").nav_file(%d)<cr>', i), opts)
		-- 	keymap(
		-- 		"n",
		-- 		"<leader>h" .. i,
		-- 		string.format('<cmd>:lua require("harpoon.tmux").sendCommand("{last}", %d)<cr>', i),
		-- 		opts
		-- 	)
		-- end



		-- basic telescope configuration
		local conf = require("telescope.config").values
		local function toggle_telescope(harpoon_files)
				local file_paths = {}
				for _, item in ipairs(harpoon_files.items) do
						table.insert(file_paths, item.value)
				end

				require("telescope.pickers").new({}, {
						prompt_title = "Harpoon",
						finder = require("telescope.finders").new_table({
								results = file_paths,
						}),
						previewer = conf.file_previewer({}),
						sorter = conf.generic_sorter({}),
				}):find()
		end

		vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end,
			{ desc = "Open harpoon window" })
	end,
}
