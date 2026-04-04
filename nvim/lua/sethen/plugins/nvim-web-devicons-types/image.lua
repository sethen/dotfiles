local palette = require('catppuccin.palettes').get_palette('mocha')

local imgIcon = ' '
local imgColor = palette.peach

return {
    png = { icon = imgIcon, name = 'Png', color = imgColor },
    jpg = { icon = imgIcon, name = 'Jpg', color = imgColor },
    jpeg = { icon = imgIcon, name = 'Jpeg', color = imgColor },
    gif = { icon = imgIcon, name = 'Gif', color = imgColor },
    svg = { icon = imgIcon, name = 'Svg', color = imgColor },
    webp = { icon = imgIcon, name = 'Webp', color = imgColor },
    ico = { icon = imgIcon, name = 'Ico', color = imgColor },
    tiff = { icon = imgIcon, name = 'Tiff', color = imgColor },
    bmp = { icon = imgIcon, name = 'Bmp', color = imgColor },
    ['favicon.ico'] = { icon = imgIcon, name = 'Favicon', color = imgColor },
}
