(defun sethen/json-mode-hook ()
  "Sethen JSON Mode Hook settings!"
  (lsp-deferred))

(add-hook 'json-mode-hook 'sethen/json-mode-hook)

(provide 'sethen-json-mode-hook)
