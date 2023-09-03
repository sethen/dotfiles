(require 'use-package)

(use-package flycheck-posframe
  :after (company flycheck)
  :config
  (add-to-list 'flycheck-posframe-inhibit-functions #'(lambda () company-backend))
  :defines (flycheck-posframe-inhibit-functions company-backend)
  :hook (flycheck-mode . flycheck-posframe-mode))

(provide 'sethen-flycheck-posframe)
