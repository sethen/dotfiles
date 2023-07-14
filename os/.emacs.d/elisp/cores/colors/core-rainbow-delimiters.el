(require 'use-package)

(use-package rainbow-delimiters
  :config
  (set-face-attribute 'show-paren-match nil :foreground material-yellow :weight 'bold)
  (set-face-attribute 'rainbow-delimiters-unmatched-face nil :weight 'bold))

(provide 'core-rainbow-delimiters)
