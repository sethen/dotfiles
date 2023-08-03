(require 'use-package)

(use-package git-modes
  :init
  (add-to-list 'auto-mode-alist (cons "/.dockerignore\\'" 'gitignore-mode))
  (add-to-list 'auto-mode-alist (cons "/.gitignore_global\\'" 'gitignore-mode)))

(provide 'sethen-git-modes)
