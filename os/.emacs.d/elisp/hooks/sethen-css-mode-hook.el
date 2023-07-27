(defun sethen/css-mode-hook ()
  "Sethen CSS Mode Hook settings!"
  (lsp-deferred))

(add-hook 'css-mode-hook 'sethen/css-mode-hook)

(provide 'sethen-css-mode-hook)
