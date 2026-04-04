local palette = require('catppuccin.palettes').get_palette('mocha')

local nginxIcon = ' '
local nginxColor = palette.green

return {
    nginx = { icon = nginxIcon, name = 'Nginx', color = nginxColor },
    ['nginx.conf'] = { icon = nginxIcon, name = 'NginxConf', color = nginxColor },
}
