(defun sethen/typescript-mode-hook ()
  "Sethen Typescript Mode Hook settings!"
  (lsp-deferred)
  (setq typescript-indent-level 2))

(add-hook 'typescript-mode-hook 'sethen/typescript-mode-hook)

(provide 'sethen-typescript-mode-hook)
