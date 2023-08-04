(defun sethen/sh-mode-hook ()
  "Sethen Sh Mode Hook settings!"
  (eglot-ensure))

(add-hook 'sh-mode-hook 'sethen/sh-mode-hook)

(provide 'sethen-sh-mode-hook)
