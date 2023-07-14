(require 'use-package)

(use-package doom-modeline
  :commands (doom-modeline-mode)
  :config (setq doom-modeline-icon nil)
  :init (doom-modeline-mode))

(provide 'core-doom-modeline)
