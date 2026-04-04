local palette = require('catppuccin.palettes').get_palette('mocha')

local babelIcon = ' '
local babelColor = palette.yellow

return {
    ['babel.config.js'] = { icon = babelIcon, name = 'Babel', color = babelColor },
    ['babel.config.mjs'] = { icon = babelIcon, name = 'Babel', color = babelColor },
    ['.babelrc'] = { icon = babelIcon, name = 'Babelrc', color = babelColor },
}
