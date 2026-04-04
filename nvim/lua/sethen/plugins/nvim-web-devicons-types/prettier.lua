local palette = require('catppuccin.palettes').get_palette('mocha')

return {
    ['.prettierrc'] = { icon = ' ', name = 'Prettierrc', color = palette.sky },
    ['.prettierrc.js'] = { icon = ' ', name = 'Prettierrc', color = palette.sky },
    ['.prettierrc.json'] = { icon = ' ', name = 'Prettierrc', color = palette.sky },
    ['.prettierrc.yaml'] = { icon = ' ', name = 'Prettierrc', color = palette.sky },
    ['.prettierrc.toml'] = { icon = ' ', name = 'Prettierrc', color = palette.sky },
    ['prettier.config.js'] = { icon = ' ', name = 'PrettierConfig', color = palette.sky },
    ['prettier.config.mjs'] = { icon = ' ', name = 'PrettierConfig', color = palette.sky },
}
