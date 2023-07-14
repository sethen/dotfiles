(defun layer/rust-mode-hook ()
  "Layer Rust Mode Hook settings!"
  (lsp-deferred))

(add-hook 'rust-mode-hook 'layer/rust-mode-hook)

(provide 'layer-rust-mode-hook)
