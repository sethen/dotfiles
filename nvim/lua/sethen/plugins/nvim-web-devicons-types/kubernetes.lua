local palette = require('catppuccin.palettes').get_palette('mocha')

return {
    ['kubernetes.yaml'] = { icon = ' ', name = 'Kubernetes', color = palette.sapphire },
    ['kubernetes.yml'] = { icon = ' ', name = 'Kubernetes', color = palette.sapphire },
    ['kustomization.yaml'] = { icon = ' ', name = 'Kustomization', color = palette.sapphire },
    ['kustomization.yml'] = { icon = ' ', name = 'Kustomization', color = palette.sapphire },
}
