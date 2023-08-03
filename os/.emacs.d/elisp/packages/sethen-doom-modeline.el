(require 'use-package)

(use-package doom-modeline
  :commands (doom-modeline-mode)
  :custom (doom-modeline-icon nil)
  :init (doom-modeline-mode))

(provide 'sethen-doom-modeline)
