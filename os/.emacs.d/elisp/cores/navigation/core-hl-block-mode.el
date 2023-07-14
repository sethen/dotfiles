(require 'use-package)

(use-package hl-block-mode
  :commands (hl-block-mode)
  :config (setq hl-block-style 'bracket))

(provide 'core-hl-block-mode)
