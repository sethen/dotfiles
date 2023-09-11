(require 'use-package)

(use-package general
  :commands (general-define-key)
  :init
  (general-define-key
   :prefix "C-c"
   "rg" 'consult-ripgrep
   "t" 'treemacs))

(provide 'sethen-general)
