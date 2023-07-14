(defun layer/css-mode-hook ()
  "Layer CSS Mode Hook settings!"
  (lsp-deferred)
  (set (make-local-variable 'company-backends) '(company-capf)))

(add-hook 'css-mode-hook 'layer/css-mode-hook)

(provide 'layer-css-mode-hook)
