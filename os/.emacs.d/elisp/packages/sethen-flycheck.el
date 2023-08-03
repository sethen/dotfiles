(require 'use-package)

(use-package flycheck
  :bind (:map flycheck-mode-map
	      ("M-j" . flycheck-next-error)
	      ("M-k" . flycheck-previous-error))
  :commands (global-flycheck-mode)
  :config (setq flycheck-emacs-lisp-load-path 'inherit)
  :init (global-flycheck-mode))

(provide 'sethen-flycheck)
