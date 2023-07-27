(defun sethen/sh-mode-hook ()
  "Sethen Sh Mode Hook settings!"
  (lsp-deferred))

(add-hook 'sh-mode-hook 'sethen/sh-mode-hook)

(provide 'sethen-sh-mode-hook)
