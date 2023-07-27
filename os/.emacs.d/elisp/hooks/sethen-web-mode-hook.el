(defun sethen/web-mode-hook ()
  "Sethen Web Mode Hook settings!"
  (lsp-deferred)
  ;; Use Company backends as Capfs.
  (setq-local completion-at-point-functions
	      (mapcar #'cape-company-to-capf
		      (list #'company-web-html))))

(add-hook 'web-mode-hook 'sethen/web-mode-hook)

(provide 'sethen-web-mode-hook)
