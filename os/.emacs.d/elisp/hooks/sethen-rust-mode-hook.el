(defun sethen/rust-mode-hook ()
  "Sethen Rust Mode Hook settings!"
  (lsp-deferred))

(add-hook 'rust-mode-hook 'sethen/rust-mode-hook)

(provide 'sethen-rust-mode-hook)
