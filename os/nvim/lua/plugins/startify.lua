local M = {}

function Options()
	local g = vim.g

	g['startify_change_to_dir'] = 0
end

function M.config()
	Options()
end

return M

