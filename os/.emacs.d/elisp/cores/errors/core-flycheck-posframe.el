(require 'use-package)

(use-package flycheck-posframe
  :after (company flycheck)
  :config
  (add-to-list 'flycheck-posframe-inhibit-functions #'(lambda () company-backend))
  :defines (flycheck-posframe-inhbit-functions)
  :hook (flycheck-mode . flycheck-posframe-mode))

(provide 'core-flycheck-posframe)
