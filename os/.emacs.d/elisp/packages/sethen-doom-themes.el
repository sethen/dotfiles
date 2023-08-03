(require 'use-package)

(use-package doom-themes
  :custom
  (doom-themes-enable-bold nil)
  (doom-themes-enable-italic nil)
  :config
  (load-theme 'doom-material t))


(provide 'sethen-doom-themes)
