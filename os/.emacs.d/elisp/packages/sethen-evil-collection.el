(require 'use-package)

(use-package evil-collection
  :after (evil)
  :commands (evil-collection-init)
  :init (evil-collection-init))

(provide 'sethen-evil-collection)
