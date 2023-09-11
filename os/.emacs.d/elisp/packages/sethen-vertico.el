(require 'use-package)

(use-package vertico
  :bind (:map vertico-map
	      ("M-j" . 'vertico-next)
	      ("M-k" . 'vertico-previous)
	      ("M-l" . 'vertico-insert))
  :commands
  (vertico-insert vertico-mode vertico-next vertico-previous)
  :elpaca (:files (:defaults "extensions/*"))
  :init
  (vertico-multiform-mode)
  (vertico-mode))

(provide 'sethen-vertico)
