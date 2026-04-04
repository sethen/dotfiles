local palette = require('catppuccin.palettes').get_palette('mocha')

return {
    ['babel.config.js'] = { icon = ' ', name = 'Babel', color = palette.yellow },
    ['babel.config.mjs'] = { icon = ' ', name = 'Babel', color = palette.yellow },
    ['.babelrc'] = { icon = ' ', name = 'Babelrc', color = palette.yellow },
}
