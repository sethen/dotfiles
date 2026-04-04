local palette = require('catppuccin.palettes').get_palette('mocha')

local zipIcon = ' '
local zipColor = palette.yellow

return {
    zip = { icon = zipIcon, name = 'Zip', color = zipColor },
    tar = { icon = zipIcon, name = 'Tar', color = zipColor },
    gz = { icon = zipIcon, name = 'Gz', color = zipColor },
    rar = { icon = zipIcon, name = 'Rar', color = zipColor },
    ['7z'] = { icon = zipIcon, name = '7z', color = zipColor },
    xz = { icon = zipIcon, name = 'Xz', color = zipColor },
}
