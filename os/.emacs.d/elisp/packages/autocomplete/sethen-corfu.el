(require 'use-package)

(use-package corfu
  :bind (:map corfu-map
	      ("M-l" . corfu-insert)
	      ("M-j" . corfu-next)
	      ("M-k" . corfu-previous))
  :custom
  (corfu-auto t)
  (corfu-auto-delay 0)
  (corfu-auto-prefix 1)
  (corfu-separator "[ &]")
  (corfu-preselect 'prompt)
  :elpaca (:files (:defaults "extensions/*"))
  :init
  (corfu-popupinfo-mode)
  (global-corfu-mode))

(provide 'sethen-corfu)
