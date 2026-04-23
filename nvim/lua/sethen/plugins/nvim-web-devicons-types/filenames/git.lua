local palette = require('catppuccin.palettes').get_palette('mocha')

local gitIcon = ' '
local gitColor = palette.overlay2

return {
    ['.gitignore'] = { icon = gitIcon, name = 'Gitignore', color = gitColor },
    ['.gitignore_global'] = { icon = gitIcon, name = 'Gitignore_global', color = gitColor },
    ['.gitconfig'] = { icon = gitIcon, name = 'Gitconfig', color = gitColor },
}
