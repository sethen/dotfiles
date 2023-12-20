return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	config = function()
		require("noice").setup({
			presets = {
				command_palette = true
			},
			lsp = {
				signature = {
					enabled = false
				},
			},
		})
	end,
}
