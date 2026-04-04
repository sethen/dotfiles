local palette = require('catppuccin.palettes').get_palette('mocha')

local capIcon = ' '
local capColor = palette.sky

return {
    ['capacitor.config.ts'] = { icon = capIcon, name = 'Capacitor', color = capColor },
    ['capacitor.config.js'] = { icon = capIcon, name = 'Capacitor', color = capColor },
}
