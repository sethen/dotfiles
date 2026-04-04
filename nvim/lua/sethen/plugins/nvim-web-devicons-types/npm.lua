local palette = require('catppuccin.palettes').get_palette('mocha')

local npmIcon = ' '
local npmColor = palette.red

return {
    ['.npmignore'] = { icon = npmIcon, name = 'Npmignore', color = npmColor },
    ['.npmrc'] = { icon = npmIcon, name = 'Npmrc', color = npmColor },
    ['.nvmrc'] = { icon = npmIcon, name = 'Nvmrc', color = npmColor },
    ['package.json'] = { icon = npmIcon, name = 'Package', color = npmColor },
    ['package-lock.json'] = { icon = npmIcon, name = 'PackageLock', color = npmColor },
    ['pnpm-lock.yaml'] = { icon = npmIcon, name = 'PNPMLock', color = npmColor },
}
