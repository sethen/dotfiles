(defun sethen/typescript-mode-hook ()
  "Sethen Typescript Mode Hook settings!"
  (lsp-deferred))

(add-hook 'typescript-mode-hook 'sethen/typescript-mode-hook)

(provide 'sethen-typescript-mode-hook)
