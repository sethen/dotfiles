(require 'use-package)

(use-package flycheck-posframe
  :after (company flycheck)
  :config
  (add-to-list 'flycheck-posframe-inhibit-functions #'(lambda () (and (bound-and-true-p corfu-mode) (bound-and-true-p completion-in-region-mode))))
  :defines (flycheck-posframe-inhbit-functions corfu--candidates)
  :hook (flycheck-mode . flycheck-posframe-mode))

(provide 'sethen-flycheck-posframe)
