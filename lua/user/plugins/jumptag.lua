return {
	"harrisoncramer/jump-tag",
	config = function()
		local keymap = vim.api.nvim_set_keymap
		keymap("n", "tk", ':lua require("jump-tag").jumpParent()<CR>', { noremap = true, silent = true })
		keymap("n", "tj", ':lua require("jump-tag").jumpChild()<CR>', { noremap = true, silent = true })
		keymap("n", "tl", ':lua require("jump-tag").jumpNextSibling()<CR>', { noremap = true, silent = true })
		keymap("n", "th", ':lua require("jump-tag").jumpPrevSibling()<CR>', { noremap = true, silent = true })
	end,
}
