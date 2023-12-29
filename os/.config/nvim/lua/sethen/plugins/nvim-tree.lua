return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons"
	},
	config = function()
		require("nvim-tree").setup({
			renderer = {
				highlight_git = true,
				icons = {
					glyphs = {
						folder = {
							default = "",
							empty = "",
							open = "",
						},
					},
					show = {
						folder_arrow = false,
						git = false
					}
				}
			}
		})
	end
}
