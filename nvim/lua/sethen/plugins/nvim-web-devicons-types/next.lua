local palette = require('catppuccin.palettes').get_palette('mocha')

return {
    ['next.config.js'] = { icon = ' ', name = 'NextConfig', color = palette.text },
    ['next.config.mjs'] = { icon = ' ', name = 'NextConfig', color = palette.text },
    ['next.config.ts'] = { icon = ' ', name = 'NextConfig', color = palette.text },
}
