(use-package company
  :bind (:map company-active-map
	      ("M-j" . 'company-select-next)
	      ("M-k" . 'company-select-previous)
	      ("M-l" . 'company-complete-selection)
	      ("M-n" . 'company-other-backend))
  :commands
  (company-complete-selection
   company-other-backend
   company-select-next
   company-select-previous
   global-company-mode)
  :config
  (setq company-idle-delay 0
	company-minimum-prefix-length 1)
  :init (global-company-mode))

(provide 'layer-company)
