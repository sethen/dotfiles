(defun layer/markdown-mode-hook ()
  "Markdown Markdown Mode Hook settings!"
  (rainbow-mode))

(add-hook 'markdown-mode-hook 'layer/markdown-mode-hook)

(provide 'layer-markdown-mode-hook)
