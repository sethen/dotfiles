local palette = require('catppuccin.palettes').get_palette('mocha')

local tfIcon = ' '
local tfColor = palette.mauve

return {
    tf = { icon = tfIcon, name = 'Tf', color = tfColor },
    tfvars = { icon = tfIcon, name = 'Tfvars', color = tfColor },
}
