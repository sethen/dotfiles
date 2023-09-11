(require 'use-package)

(use-package projectile
  :custom (projectile-project-search-path '(("~/Developer" . 1)))
  :init (projectile-mode))

(provide 'sethen-projectile)
