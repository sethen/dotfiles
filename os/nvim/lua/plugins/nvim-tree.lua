local M = {}

function Mappings()
	local nvim_set_keymap = vim.api.nvim_set_keymap

	nvim_set_keymap('n', '<leader><leader>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
end

function Options()
	local g = vim.g

	g['nvim_tree_show_icons'] = {
		git = 0,
		folders = 1,
		files = 1,
		folder_arrows = 0,
	}
end

function M.config()
	Mappings()
	Options()
end

return M

