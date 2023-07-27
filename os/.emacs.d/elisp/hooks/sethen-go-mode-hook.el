(defun sethen/go-mode-hook ()
  "Sethen Go Mode Hook settings!"
  (lsp-deferred))

(add-hook 'go-mode-hook 'sethen/go-mode-hook)

(provide 'sethen-go-mode-hook)
