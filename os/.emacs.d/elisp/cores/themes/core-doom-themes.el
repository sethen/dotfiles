(require 'use-package)

(use-package doom-themes
  :config
  (setq doom-themes-enable-bold nil
	doom-themes-enable-italic nil)
  (load-theme 'doom-material t))


(provide 'core-doom-themes)
