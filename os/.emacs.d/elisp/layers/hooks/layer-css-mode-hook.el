(defun layer/css-mode-hook ()
  "Layer CSS Mode Hook settings!"
  (lsp-deferred))

(add-hook 'css-mode-hook 'layer/css-mode-hook)

(provide 'layer-css-mode-hook)
