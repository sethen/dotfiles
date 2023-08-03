(require 'use-package)

(setq evil-want-keybinding nil)

(use-package evil
  :custom
  (evil-search-module 'evil-search)
  (evil-undo-system 'undo-redo)
  :defines (evil-search-module)
  :init
  (evil-mode))

(provide 'sethen-evil)
