local palette = require('catppuccin.palettes').get_palette('mocha')

local shellIcon = ' '
local shellColor = palette.green

return {
    sh = { icon = shellIcon, name = 'Sh', color = shellColor },
    bash = { icon = shellIcon, name = 'Bash', color = shellColor },
    zsh = { icon = shellIcon, name = 'Zsh', color = shellColor },
    fish = { icon = shellIcon, name = 'Fish', color = shellColor },
    ['.bashrc'] = { icon = shellIcon, name = 'Bashrc', color = shellColor },
    ['.bash_profile'] = { icon = shellIcon, name = 'BashProfile', color = shellColor },
    ['.aliases'] = { icon = shellIcon, name = 'Aliases', color = shellColor },
    ['.zshenv'] = { icon = shellIcon, name = 'Zshenv', color = shellColor },
    ['.zshrc'] = { icon = shellIcon, name = 'Zshrc', color = shellColor },
    ['.zprofile'] = { icon = shellIcon, name = 'Zprofile', color = shellColor },
}
