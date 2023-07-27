(defun sethen/js-mode-hook ()
  "Sethen JS Mode Hook settings!"
  (lsp-deferred))

(add-hook 'js-mode-hook 'sethen/js-mode-hook)

(provide 'sethen-js-mode-hook)
