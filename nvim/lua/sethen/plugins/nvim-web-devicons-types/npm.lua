local palette = require('catppuccin.palettes').get_palette('mocha')

return {
    ['.npmignore'] = { icon = ' ', name = 'Npmignore', color = palette.red },
    ['.npmrc'] = { icon = ' ', name = 'Npmrc', color = palette.red },
    ['.nvmrc'] = { icon = ' ', name = 'Nvmrc', color = palette.red },
    ['package.json'] = { icon = ' ', name = 'Package', color = palette.red },
    ['package-lock.json'] = { icon = ' ', name = 'PackageLock', color = palette.red },
    ['pnpm-lock.yaml'] = { icon = ' ', name = 'PNPMLock', color = palette.red },
}
