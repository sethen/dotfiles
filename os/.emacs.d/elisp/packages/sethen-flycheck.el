(require 'use-package)

(use-package flycheck
  :bind (:map flycheck-mode-map
	      ("M-j" . flycheck-next-error)
	      ("M-k" . flycheck-previous-error))
  :commands (global-flycheck-mode)
  :config (global-flycheck-mode))

(provide 'sethen-flycheck)
