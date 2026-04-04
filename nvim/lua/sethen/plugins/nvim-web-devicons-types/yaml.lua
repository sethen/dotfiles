local palette = require('catppuccin.palettes').get_palette('mocha')

local yamlIcon = ' '
local yamlColor = palette.red

return {
    yaml = { icon = yamlIcon, name = 'Yaml', color = yamlColor },
    yml = { icon = yamlIcon, name = 'Yml', color = yamlColor },
}
