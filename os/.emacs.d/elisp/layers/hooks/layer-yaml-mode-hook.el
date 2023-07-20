(defun layer/yaml-mode-hook ()
  "Layer YAML Mode Hook settings!"
  (lsp-deferred))

(add-hook 'yaml-mode-hook 'layer/yaml-mode-hook)

(provide 'layer-yaml-mode-hook)
