local palette = require('catppuccin.palettes').get_palette('mocha')

local textIcon = ' '
local textColor = palette.overlay2

return {
   txt = { icon = textIcon, name = 'Txt', color = textColor },
   env = { icon = textIcon, name = 'Env', color = textColor },
   pdf = { icon = textIcon, name = 'Pdf', color = textColor },
   xls = { icon = textIcon, name = 'Xls', color = textColor },
   bak = { icon = textIcon, name = 'Bak', color = textColor },
   cgi = { icon = textIcon, name = 'Cgi', color = textColor },
   conf = { icon = textIcon, name = 'Conf', color = textColor },
   info = { icon = textIcon, name = 'Info', color = textColor },
   ps1 = { icon = textIcon, name = 'Ps1', color = textColor },
   lock = { icon = textIcon, name = 'Lock', color = textColor },
   ['.env'] = { icon = textIcon, name = 'Env', color = textColor },
   ['config'] = { icon = textIcon, name = 'Config', color = textColor },
   ['procfile'] = { icon = textIcon, name = 'Procfile', color = textColor },
   ['alpha'] = { icon = textIcon, name = 'Alpha', color = textColor },
   ['commit_editmsg'] = { icon = textIcon, name = 'Commit', color = textColor },
   ['.editorconfig'] = { icon = textIcon, name = 'Editorconfig', color = textColor },
   ['favicon.ico'] = { icon = textIcon, name = 'Favicon', color = textColor },
   ['README.md'] = { icon = textIcon, name = 'Readme', color = textColor },
}
