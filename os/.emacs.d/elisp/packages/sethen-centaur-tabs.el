(require 'use-package)

(use-package centaur-tabs
  :after (evil)
  :bind
  (:map evil-normal-state-map
	("g l" . centaur-tabs-forward)
        ("g h" . centaur-tabs-backward))
  :config
  (custom-set-faces
   `(centaur-tabs-selected-modified ((t (:foreground "#ffcb6b" :weight bold))))
   `(centaur-tabs-unselected-modified ((t (:foreground "#ffcb6b")))))
  :custom
  (centaur-tabs-height 32)
  (centaur-tabs-set-bar 'left)
  (centaur-tabs-style "bar")
  (centaur-tabs-set-modified-marker t)
  (centaur-tabs-modified-marker "")
  :init
  (centaur-tabs-mode t))

(provide 'sethen-centaur-tabs)
