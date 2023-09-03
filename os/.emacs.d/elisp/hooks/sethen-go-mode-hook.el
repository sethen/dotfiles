(defun sethen/go-mode-hook ()
  "Sethen Go Mode Hook settings!"
  (lsp-deferred)
  (tree-sitter-hl-mode))

(add-hook 'go-mode-hook 'sethen/go-mode-hook)
(add-hook 'go-ts-mode-hook 'sethen/go-mode-hook)

(provide 'sethen-go-mode-hook)
