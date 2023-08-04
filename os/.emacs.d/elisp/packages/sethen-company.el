(require 'use-package)

(use-package company
  :bind (:map company-active-map
	      ("M-l" . 'company-complete-selection)
	      ("M-n" . 'company-other-backend))
  :commands
  (company-complete-selection
   company-other-backend
   global-company-mode)
  :custom
  (company-idle-delay 0)
  (company-minimum-prefix-length 1)
  :init (global-company-mode))

(provide 'sethen-company)
