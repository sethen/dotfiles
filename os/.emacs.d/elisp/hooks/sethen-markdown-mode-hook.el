(defun sethen/markdown-mode-hook ()
  "Markdown Markdown Mode Hook settings!"
  (rainbow-mode))

(add-hook 'markdown-mode-hook 'sethen/markdown-mode-hook)

(provide 'sethen-markdown-mode-hook)
