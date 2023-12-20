return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")

		cmp.setup({
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(),
				["<C-j>"] = cmp.mapping.select_next_item(),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-x>"] = cmp.mapping.abort(),
				["<C-l>"] = cmp.mapping.confirm({ select = false }),
			}),
			sources = {
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" }
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			}
		})
	end,
}
