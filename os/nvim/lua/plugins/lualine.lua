local M = {}

function FileName()
	local expand = vim.fn.expand
	local icons = require('nvim-web-devicons')
	local fileName, fileExtension = expand('%:t'), expand('%:e')
	local icon = icons.get_icon(fileName, fileExtension)

	if icon then
		return icon .. ' ' .. fileName
	end
end

function FileFormat()
	return vim.bo.fileformat
end

function M.config()
	require'lualine'.setup {
		options = {
			icons_enabled = true,
			theme = 'material',
			component_separators = { '', '' },
			section_separators = { '', '' },
			disabled_filetypes = { 'startify', 'NvimTree' }
		},
		sections = {
			lualine_a = { 'mode' },
			lualine_b = { FileName },
			lualine_c = {},
			lualine_x = { 'diff', 'branch' },
			lualine_y = { 'encoding', FileFormat },
			lualine_z = { 'location' }
		},
		inactive_sections = {
			lualine_a = { FileName },
			lualine_b = {},
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = {}
		},
		tabline = {},
		extensions = {}
	}
end

return M

