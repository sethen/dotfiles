local M = {}

function Options()
	local g = vim.g

	g['Hexokinase_highlighters'] = { 'backgroundfull' }
end

function M.config()
	Options()
end

return M


