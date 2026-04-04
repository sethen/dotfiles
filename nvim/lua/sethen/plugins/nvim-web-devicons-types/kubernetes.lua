local palette = require('catppuccin.palettes').get_palette('mocha')

local k8sIcon = ' '
local k8sColor = palette.sapphire

return {
    ['kubernetes.yaml'] = { icon = k8sIcon, name = 'Kubernetes', color = k8sColor },
    ['kubernetes.yml'] = { icon = k8sIcon, name = 'Kubernetes', color = k8sColor },
    ['kustomization.yaml'] = { icon = k8sIcon, name = 'Kustomization', color = k8sColor },
    ['kustomization.yml'] = { icon = k8sIcon, name = 'Kustomization', color = k8sColor },
}
