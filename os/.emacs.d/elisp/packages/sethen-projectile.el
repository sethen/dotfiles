(require 'use-package)

(use-package projectile
  :custom (projectile-project-search-path '(("~/Developer" . 1)))
  :bind-keymap ("C-c p" . projectile-command-map)
  :init (projectile-mode))

(provide 'sethen-projectile)
