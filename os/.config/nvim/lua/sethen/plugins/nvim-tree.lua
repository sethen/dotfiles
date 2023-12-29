return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons"
	},
	config = function()
		require("nvim-tree").setup({
			renderer = {
				icons = {
					glyphs = {
						folder = {
							default = "",
							empty = "",
							open = "",
						},
					},
					show = {
						folder_arrow = false
					}
				}
			}
		})
	end
}
