local palette = require('catppuccin.palettes').get_palette('mocha')

local goIcon = ' '
local goColor = palette.teal

return {
    go = { icon = goIcon, name = 'Go', color = goColor },
    ['go.mod'] = { icon = goIcon, name = 'Go', color = goColor },
    ['go.sum'] = { icon = goIcon, name = 'Go', color = goColor },
}
