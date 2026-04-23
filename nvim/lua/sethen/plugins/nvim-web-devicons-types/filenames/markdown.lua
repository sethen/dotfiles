local palette = require('catppuccin.palettes').get_palette('mocha')

local mdIcon = ' '
local licenseIcon = ' '
local mdColor = palette.overlay2

return {
    md = { icon = mdIcon, name = 'Md', color = mdColor },
    ['LICENSE.md'] = { icon = licenseIcon, name = 'License', color = mdColor },
}
