(defun sethen/css-mode-hook ()
  "Sethen CSS Mode Hook settings!"
  (lsp-deferred)
  (tree-sitter-hl-mode))

(add-hook 'css-mode-hook 'sethen/css-mode-hook)
(add-hook 'css-ts-mode-hook 'sethen/css-mode-hook)

(provide 'sethen-css-mode-hook)
