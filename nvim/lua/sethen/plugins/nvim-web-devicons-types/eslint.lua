local palette = require('catppuccin.palettes').get_palette('mocha')

local eslintIcon = ' '
local eslintColor = palette.lavender

return {
    ['eslint.config.js'] = { icon = eslintIcon, name = 'Eslint', color = eslintColor },
    ['eslint.config.mjs'] = { icon = eslintIcon, name = 'Eslint', color = eslintColor },
    ['.eslintrc'] = { icon = eslintIcon, name = 'Eslintrc', color = eslintColor },
    ['.eslintrc.js'] = { icon = eslintIcon, name = 'Eslintrc', color = eslintColor },
    ['.eslintrc.json'] = { icon = eslintIcon, name = 'Eslintrc', color = eslintColor },
}
