(defun sethen/lsp-completion-mode-hook ()
  "Sethen LSP Completion Mode Hook settings!"
  (setf (alist-get 'styles (alist-get 'lsp-completion-capf completion-category-defaults))
	'(orderless)))

(add-hook 'lsp-completion-mode-hook 'sethen/lsp-completion-mode-hook)

(provide 'sethen-lsp-completion-mode-hook)
