(defun layer/ruby-mode-hook ()
  "Layer Ruby Mode Hook settings!"
  (lsp-deferred))

(add-hook 'ruby-mode-hook 'layer/ruby-mode-hook)

(provide 'layer-ruby-mode-hook)
