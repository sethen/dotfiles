local palette = require('catppuccin.palettes').get_palette('mocha')

local binIcon = ' '
local binColor = palette.overlay2

return {
    so = { icon = binIcon, name = 'So', color = binColor },
    bin = { icon = binIcon, name = 'Bin', color = binColor },
    exe = { icon = binIcon, name = 'Exe', color = binColor },
    dll = { icon = binIcon, name = 'Dll', color = binColor },
}
