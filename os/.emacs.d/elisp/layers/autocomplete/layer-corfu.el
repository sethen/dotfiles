(require 'use-package)

(use-package corfu
  :commands (global-corfu-mode)
  :custom
  (completion-styles '(basic))
  (corfu-auto t)
  (corfu-auto-delay 0)
  (corfu-auto-prefix 1)
  (corfu-preselect 'prompt)
  :init
  (global-corfu-mode))

(provide 'layer-corfu)
