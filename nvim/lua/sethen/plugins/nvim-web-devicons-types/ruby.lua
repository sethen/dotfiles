local palette = require('catppuccin.palettes').get_palette('mocha')

local rbIcon = ' '
local rbColor = palette.red

return {
    rb = { icon = rbIcon, name = 'Rb', color = rbColor },
    ru = { icon = rbIcon, name = 'Ru', color = rbColor },
    erb = { icon = rbIcon, name = 'Erb', color = rbColor },
    ['Rakefile'] = { icon = rbIcon, name = 'Rakefile', color = rbColor },
    ['rake'] = { icon = rbIcon, name = 'Rake', color = rbColor },
    ['config.ru'] = { icon = rbIcon, name = 'ConfigRu', color = rbColor },
}
