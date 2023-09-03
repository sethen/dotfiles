(defun sethen/markdown-mode-hook ()
  "Markdown Markdown Mode Hook settings!"
  (rainbow-mode)
  (tree-sitter-hl-mode))

(add-hook 'markdown-mode-hook 'sethen/markdown-mode-hook)
(add-hook 'markdown-ts-mode-hook 'sethen/markdown-mode-hook)

(provide 'sethen-markdown-mode-hook)
