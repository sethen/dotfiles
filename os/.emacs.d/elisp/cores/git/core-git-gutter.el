(require 'use-package)

(use-package git-gutter
  :commands (global-git-gutter-mode)
  :init (global-git-gutter-mode))

(provide 'core-git-gutter)
