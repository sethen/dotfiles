local palette = require('catppuccin.palettes').get_palette('mocha')

local tmuxIcon = ' '
local tmuxColor = palette.green

return {
    ['tmux.conf'] = { icon = tmuxIcon, name = 'Tmux', color = tmuxColor },
}
