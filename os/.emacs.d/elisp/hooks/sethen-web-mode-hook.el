(defun sethen/web-mode-hook ()
  "Sethen Web Mode Hook settings!"
  (lsp-deferred)
  (when (and (stringp buffer-file-name)
	     (string-match "\\.tsx$" buffer-file-name))
    (tide-setup)))

(add-hook 'web-mode-hook 'sethen/web-mode-hook)

(provide 'sethen-web-mode-hook)
