(require 'use-package)

(use-package marginalia
  :after (vertico)
  :commands (marginalia-mode)
  :init (marginalia-mode))

(provide 'sethen-marginalia)
