return {
	"nvim-tree/nvim-web-devicons",
	config = function()
		require("nvim-web-devicons").setup({
			override = {
				lua = {
					icon = "",
					name = "Lua"
				},
			},
		})
	end
}
