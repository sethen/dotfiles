local palette = require('catppuccin.palettes').get_palette('mocha')

local javaIcon = ' '
local javaColor = palette.peach

return {
    java = { icon = javaIcon, name = 'Java', color = javaColor },
    jar = { icon = javaIcon, name = 'Jar', color = javaColor },
}
