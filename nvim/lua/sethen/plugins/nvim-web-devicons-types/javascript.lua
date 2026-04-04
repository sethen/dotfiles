local palette = require('catppuccin.palettes').get_palette('mocha')

local jsIcon = ' '
local jsxIcon = ' '
local jsColor = palette.yellow
local jsxColor = palette.blue
local jsTestColor = palette.sky
local pkgColor = palette.blue

return {
    js = { icon = jsIcon, name = 'Js', color = jsColor },
    jsx = { icon = jsxIcon, name = 'Jsx', color = jsxColor },
    cjs = { icon = jsIcon, name = 'Cjs', color = jsColor },
    mjs = { icon = jsIcon, name = 'Mjs', color = jsColor },
    ['js.map'] = { icon = jsIcon, name = 'Jsmap', color = jsColor },
    ['test.js'] = { icon = jsIcon, name = 'TestJs', color = jsTestColor },
    ['test.jsx'] = { icon = jsIcon, name = 'TestJsx', color = jsTestColor },
    ['.prettierrc.mjs'] = { icon = jsIcon, name = 'Prettierrc', color = jsColor },
    ['test.js'] = { icon = jsIcon, name = 'TestJs', color = jsTestColor },
    ['test.jsx'] = { icon = jsIcon, name = 'TestJsx', color = jsTestColor },
    ['package.json'] = { icon = ' ', name = 'Package', color = pkgColor },
    ['package-lock.json'] = { icon = ' ', name = 'PackageLock', color = pkgColor },
    ['pnpm-lock.yaml'] = { icon = ' ', name = 'PNPMLock', color = pkgColor },
}
