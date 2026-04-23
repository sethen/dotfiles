local palette = require('catppuccin.palettes').get_palette('mocha')

local tsIcon = ' '
local tsxIcon = ' '
local tsColor = palette.blue
local tsTestColor = palette.sky

return {
    ts = { icon = tsIcon, name = 'Ts', color = tsColor },
    ['d.ts'] = { icon = tsIcon, name = 'DTS', color = tsColor },
    ['test.ts'] = { icon = tsIcon, name = 'TestTs', color = tsTestColor },
    ['spec.ts'] = { icon = tsIcon, name = 'Spec', color = tsTestColor },
    tsx = { icon = tsxIcon, name = 'Tsx', color = tsColor },
    ['test.tsx'] = { icon = tsxIcon, name = 'TestTsx', color = tsTestColor },
    ['spec.tsx'] = { icon = tsxIcon, name = 'SpecTsx', color = tsTestColor },
    ['tailwind.config.ts'] = { icon = tsIcon, name = 'Tailwind', color = tsColor },
    ['vite.config.ts'] = { icon = tsIcon, name = 'ViteConfig', color = tsColor },
    ['next.config.js'] = { icon = tsIcon, name = 'NextConfig', color = tsColor },
    ['next.config.mjs'] = { icon = tsIcon, name = 'NextConfig', color = tsColor },
}
