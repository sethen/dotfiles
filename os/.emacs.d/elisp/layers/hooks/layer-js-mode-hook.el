(defun layer/js-mode-hook ()
  "Layer JS Mode Hook settings!"
  (lsp-deferred))

(add-hook 'js-mode-hook 'layer/js-mode-hook)

(provide 'layer-js-mode-hook)
