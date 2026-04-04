local palette = require('catppuccin.palettes').get_palette('mocha')

local fontIcon = ' '
local fontColor = palette.peach

return {
    otf = { icon = fontIcon, name = 'Otf', color = fontColor },
    ttf = { icon = fontIcon, name = 'Ttf', color = fontColor },
    woff = { icon = fontIcon, name = 'Woff', color = fontColor },
    woff2 = { icon = fontIcon, name = 'Woff2', color = fontColor },
}
