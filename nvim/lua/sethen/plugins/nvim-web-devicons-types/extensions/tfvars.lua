local palette = require('catppuccin.palettes').get_palette('mocha')
local icon = ' '
local color = palette.mauve

return {
    tfvars = { icon = icon, name = 'Tfvars', color = color },
}