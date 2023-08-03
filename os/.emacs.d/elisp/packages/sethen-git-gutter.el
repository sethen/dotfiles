(require 'use-package)

(use-package git-gutter
  :commands (global-git-gutter-mode)
  :custom
  (git-gutter:window-width 2)
  (git-gutter:modified-sign "")
  (git-gutter:added-sign "")
  (git-gutter:deleted-sign "")
  :init (global-git-gutter-mode))

(provide 'sethen-git-gutter)
