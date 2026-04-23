local palette = require('catppuccin.palettes').get_palette('mocha')

local gqlIcon = ' '
local gqlColor = palette.pink

return {
    graphql = { icon = gqlIcon, name = 'Graphql', color = gqlColor },
    gql = { icon = gqlIcon, name = 'Gql', color = gqlColor },
}
