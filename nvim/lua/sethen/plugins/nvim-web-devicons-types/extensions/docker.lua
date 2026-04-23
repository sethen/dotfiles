local palette = require('catppuccin.palettes').get_palette('mocha')

local dockerIcon = ' '
local dockerColor = palette.blue

return {
    ['.dockerignore'] = { icon = dockerIcon, name = 'Dockerignore', color = dockerColor },
    ['.env.docker'] = { icon = dockerIcon, name = 'EnvDocker', color = dockerColor },
    ['dockerfile'] = { icon = dockerIcon, name = 'Dockerfile', color = dockerColor },
    ['dockerfile.dev'] = { icon = dockerIcon, name = 'Dockerfile', color = dockerColor },
    ['dockerfile.prod'] = { icon = dockerIcon, name = 'Dockerfile', color = dockerColor },
    ['docker-compose.yml'] = { icon = dockerIcon, name = 'DockerCompose', color = dockerColor },
}
