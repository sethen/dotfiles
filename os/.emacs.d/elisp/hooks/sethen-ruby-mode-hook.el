(defun sethen/ruby-mode-hook ()
  "Sethen Ruby Mode Hook settings!"
  (lsp-deferred)
  (tree-sitter-hl-mode))

(add-hook 'ruby-mode-hook 'sethen/ruby-mode-hook)
(add-hook 'ruby-ts-mode-hook 'sethen/ruby-mode-hook)

(provide 'sethen-ruby-mode-hook)
