local palette = require('catppuccin.palettes').get_palette('mocha')

local cIcon = ' '
local cppIcon = ' '
local cColor = palette.blue

return {
    c = { icon = cIcon, name = 'C', color = cColor },
    cc = { icon = cIcon, name = 'Cc', color = cColor },
    cpp = { icon = cppIcon, name = 'Cpp', color = cColor },
    ['makefile'] = { icon = cIcon, name = 'Makefile', color = cColor },
}
