(require 'use-package)

(use-package company-posframe
  :after (company)
  :commands (company-posframe-mode)
  :init (company-posframe-mode))

(provide 'layer-company-posframe)
