local palette = require('catppuccin.palettes').get_palette('mocha')

local angularIcon = ' '
local angularColor = palette.red

return {
    ['angular.json'] = { icon = angularIcon, name = 'Angular', color = angularColor },
}
