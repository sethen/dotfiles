(require 'use-package)

(use-package centaur-tabs
  :after (evil)
  :bind
  (:map evil-normal-state-map
	("g l" . centaur-tabs-forward)
        ("g h" . centaur-tabs-backward))
  :custom
  (centaur-tabs-style "bar")
  (centaur-tabs-height 32)
  (centaur-tabs-set-bar 'under)
  (x-underline-at-descent-line t)
  :init
  (centaur-tabs-mode t))

(provide 'sethen-centaur-tabs)
