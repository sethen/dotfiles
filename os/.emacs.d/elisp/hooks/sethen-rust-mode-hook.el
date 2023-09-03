(defun sethen/rust-mode-hook ()
  "Sethen Rust Mode Hook settings!"
  (lsp-deferred)
  (tree-sitter-hl-mode))

(add-hook 'rust-mode-hook 'sethen/rust-mode-hook)
(add-hook 'rust-ts-mode-hook 'sethen/rust-mode-hook)

(provide 'sethen-rust-mode-hook)
