(require 'use-package)

(use-package company
  :bind (:map company-active-map
	      ("M-l" . 'company-complete-selection)
	      ("M-n" . 'company-other-backend))
  :config
  (setq company-format-margin-function 'company-text-icons-margin)
  :commands
  (company-complete-selection
   company-other-backend
   global-company-mode)
  :custom
  (company-idle-delay 0)
  (company-minimum-prefix-length 1)
  :defines
  (company-active-map company-format-margin-function)
  :init (global-company-mode))

(provide 'sethen-company)
