(defun sethen/yaml-mode-hook ()
  "Sethen YAML Mode Hook settings!"
  (lsp-deferred))

(add-hook 'yaml-mode-hook 'sethen/yaml-mode-hook)

(provide 'sethen-yaml-mode-hook)
