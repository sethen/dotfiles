local palette = require('catppuccin.palettes').get_palette('mocha')

local nextIcon = ' '
local nextColor = palette.text

return {
    ['next.config.js'] = { icon = nextIcon, name = 'NextConfig', color = nextColor },
    ['next.config.mjs'] = { icon = nextIcon, name = 'NextConfig', color = nextColor },
    ['next.config.ts'] = { icon = nextIcon, name = 'NextConfig', color = nextColor },
}
