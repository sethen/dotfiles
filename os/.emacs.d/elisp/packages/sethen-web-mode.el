(require 'use-package)

(use-package web-mode
  :config
  (setq web-mode-enable-current-element-highlight t)
  (set-face-attribute 'web-mode-current-element-highlight-face nil :background nil :foreground material-yellow :weight 'bold)
  :mode
  ("\\.html?\\'" . web-mode)
  ("\\.tsx?\\'" . web-mode))

(provide 'sethen-web-mode)
