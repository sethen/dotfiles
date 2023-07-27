(defun sethen/ruby-mode-hook ()
  "Sethen Ruby Mode Hook settings!"
  (lsp-deferred))

(add-hook 'ruby-mode-hook 'sethen/ruby-mode-hook)

(provide 'sethen-ruby-mode-hook)
