(defun layer/web-mode-hook ()
  "Layer Web Mode Hook settings!"
  (lsp-deferred)
  (set (make-local-variable 'company-backends) '(company-web-html)))

(add-hook 'web-mode-hook 'layer/web-mode-hook)

(provide 'layer-web-mode-hook)
