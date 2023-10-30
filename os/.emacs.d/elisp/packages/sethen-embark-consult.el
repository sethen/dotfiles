(require 'use-package)

(use-package embark-consult
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))

(provide 'sethen-embark-consult)
