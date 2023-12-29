return {
	'nvim-telescope/telescope.nvim',
	event = "VimEnter",
	branch = '0.1.x',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				path_display = { "truncate " },
				mappings = {
					i = {
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
						["<Tab>"] = actions.toggle_selection + actions.move_selection_better,
						["<S-Tab>"] = actions.toggle_selection + actions.move_selection_worse,
					},
				},
			},
		})
	end,
	keys = {
		{ "<Space>ff", "<cmd>Telescope find_files<CR>", desc = "Telescope find files" },
		{ "<Space>fr", "<cmd>Telescope oldfiles<CR>", desc = "Telescope find recent files" },
		{ "<Space>fs", "<cmd>Telescope live_grep<CR>", desc = "Telescope find string" },
	},
}
