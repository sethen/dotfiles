local cmd = vim.cmd
local colors = require('colors')

cmd([[colorscheme material]])
cmd([[highlight CursorLine guibg=]] ..colors.grey)
cmd([[highlight CursorLineNr gui=bold guibg=]] .. colors.grey .. [[ guifg=]] .. colors.blue)
cmd([[highlight LineNr guifg=]] .. colors.pale_blue)
cmd([[highlight VertSplit guifg=]] .. colors.pale_grey)
