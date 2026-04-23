local palette = require('catppuccin.palettes').get_palette('mocha')

local jsonIcon = ' '
local jsonColor = palette.overlay2

return {
    json = { icon = jsonIcon, name = 'Json', color = jsonColor },
    jsonc = { icon = jsonIcon, name = 'Jsonc', color = jsonColor },
    ['tsconfig.json'] = { icon = jsonIcon, name = 'TsConfig', color = jsonColor },
}
