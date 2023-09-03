(defun sethen/yaml-mode-hook ()
  "Sethen YAML Mode Hook settings!"
  (lsp-deferred)
  (tree-sitter-hl-mode))

(add-hook 'yaml-mode-hook 'sethen/yaml-mode-hook)
(add-hook 'yaml-ts-mode-hook 'sethen/yaml-mode-hook)

(provide 'sethen-yaml-mode-hook)
