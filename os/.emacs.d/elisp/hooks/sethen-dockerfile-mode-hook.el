(defun sethen/dockerfile-mode-hook ()
  "Sethen Dockerfile Mode Hook settings!"
  (lsp-deferred))

(add-hook 'dockerfile-mode-hook 'sethen/dockerfile-mode-hook)

(provide 'sethen-dockerfile-mode-hook)
