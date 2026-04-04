local palette = require('catppuccin.palettes').get_palette('mocha')

local biomeIcon = ' '
local biomeColor = palette.teal

return {
    ['biome.json'] = { icon = biomeIcon, name = 'Biome', color = biomeColor },
}
