(require 'use-package)

(setq evil-want-keybinding nil)

(use-package evil
  :config
  (setq evil-search-module 'evil-search)
  :custom (evil-undo-system 'undo-redo)
  :defines (evil-search-module)
  :init
  (evil-mode))

(provide 'core-evil)
