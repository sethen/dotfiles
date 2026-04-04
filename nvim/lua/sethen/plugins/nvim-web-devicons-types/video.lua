local palette = require('catppuccin.palettes').get_palette('mocha')

local vidIcon = ' '
local vidColor = palette.red

return {
    mp4 = { icon = vidIcon, name = 'Mp4', color = vidColor },
    mkv = { icon = vidIcon, name = 'Mkv', color = vidColor },
    avi = { icon = vidIcon, name = 'Avi', color = vidColor },
    mov = { icon = vidIcon, name = 'Mov', color = vidColor },
    webm = { icon = vidIcon, name = 'Webm', color = vidColor },
    flv = { icon = vidIcon, name = 'Flv', color = vidColor },
    wmv = { icon = vidIcon, name = 'Wmv', color = vidColor },
}
