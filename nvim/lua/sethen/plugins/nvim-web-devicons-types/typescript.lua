local palette = require('catppuccin.palettes').get_palette('mocha')

local tsIcon = ' '
local tsxIcon = ' '
local tsColor = palette.blue

return {
    ts = { icon = tsIcon, name = 'Ts', color = tsColor },
    ['d.ts'] = { icon = tsIcon, name = 'DTS', color = tsColor },
    ['test.ts'] = { icon = tsIcon, name = 'TestTs', color = tsColor },
    ['spec.ts'] = { icon = tsIcon, name = 'Spec', color = tsColor },
    tsx = { icon = tsxIcon, name = 'Tsx', color = tsColor },
    ['test.ts'] = { icon = tsIcon, name = 'TestTs', color = tsColor },
    ['spec.ts'] = { icon = tsIcon, name = 'Spec', color = tsColor },
    ['tailwind.config.ts'] = { icon = tsIcon, name = 'Tailwind', color = tsColor },
    ['vite.config.ts'] = { icon = tsIcon, name = 'ViteConfig', color = tsColor },
}
