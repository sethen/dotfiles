(defun sethen/js-mode-hook ()
  "Sethen JS Mode Hook settings!"
  (lsp-deferred)
  (tree-sitter-hl-mode)
  (setq js-indent-level 2))

(add-hook 'js-mode-hook 'sethen/js-mode-hook)
(add-hook 'js-ts-mode-hook 'sethen/js-mode-hook)

(provide 'sethen-js-mode-hook)
