local cmd = vim.cmd
local colors = require('global.colors')

cmd([[colorscheme material]])
cmd([[highlight CursorLine guibg=]] ..colors.grey)
cmd([[highlight CursorLineNr gui=bold guibg=]] .. colors.grey .. [[ guifg=]] .. colors.blue)
cmd([[highlight LineNr guifg=]] .. colors.blue2)
cmd([[highlight VertSplit guifg=]] .. colors.grey3)
