return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons"
	},
	config = function()
		local function on_attach_change(bufnr)
			local nvimtree_api = require("nvim-tree.api")
			local function opts(desc)
				return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
			end

			nvimtree_api.config.mappings.default_on_attach(bufnr)

			vim.keymap.set('n', 'l', nvimtree_api.node.open.edit, opts("Open"))
		end

		local nvimtree = require("nvim-tree")

		nvimtree.setup({
			on_attach = on_attach_change,
			renderer = {
				icons = {
					show = {
						folder_arrow = false
					}
				}
			}
		})
	end
}
