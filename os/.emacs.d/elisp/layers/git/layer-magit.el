(require 'use-package)

(use-package magit
  :bind (:map magit-mode-map
	      ("M-l" . 'magit-section-toggle)
	      ("M-j" . 'magit-next-line)
	      ("M-k" . 'magit-previous-line))
  :commands
  (magit-next-line magit-previous-line magit-section-toggle))

(provide 'layer-magit)
