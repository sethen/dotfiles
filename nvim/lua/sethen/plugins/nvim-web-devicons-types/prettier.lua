local palette = require('catppuccin.palettes').get_palette('mocha')

local prettierIcon = ' '
local prettierColor = palette.sky

return {
    ['.prettierrc'] = { icon = prettierIcon, name = 'Prettierrc', color = prettierColor },
    ['.prettierrc.js'] = { icon = prettierIcon, name = 'Prettierrc', color = prettierColor },
    ['.prettierrc.json'] = { icon = prettierIcon, name = 'Prettierrc', color = prettierColor },
    ['.prettierrc.yaml'] = { icon = prettierIcon, name = 'Prettierrc', color = prettierColor },
    ['.prettierrc.toml'] = { icon = prettierIcon, name = 'Prettierrc', color = prettierColor },
    ['prettier.config.js'] = { icon = prettierIcon, name = 'PrettierConfig', color = prettierColor },
    ['prettier.config.mjs'] = { icon = prettierIcon, name = 'PrettierConfig', color = prettierColor },
}
