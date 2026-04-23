local palette = require('catppuccin.palettes').get_palette('mocha')

local svelteIcon = ' '
local svelteColor = palette.peach

return {
    svelte = { icon = svelteIcon, name = 'Svelte', color = svelteColor },
    ['svelte.config.js'] = { icon = svelteIcon, name = 'Svelte', color = svelteColor },
}
