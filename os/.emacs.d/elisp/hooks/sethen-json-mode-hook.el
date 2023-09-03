(defun sethen/json-mode-hook ()
  "Sethen JSON Mode Hook settings!"
  (lsp-deferred)
  (tree-sitter-hl-mode))

(add-hook 'json-mode-hook 'sethen/json-mode-hook)
(add-hook 'json-ts-mode-hook 'sethen/json-mode-hook)

(provide 'sethen-json-mode-hook)
