(require 'use-package)

(use-package general
  :commands (general-define-key)
  :init
  (general-define-key
   :prefix "C-c"
   "cb" 'consult-buffer
   "cf" 'consult-find
   "cl" 'consult-line
   "cm" 'consult-man
   "df" 'describe-function
   "dp" 'describe-package
   "dv" 'describe-variable
   "hf" 'helpful-function
   "hv" 'helpful-variable
   "im" 'consult-imenu
   "mg" 'magit
   "nt" 'smudge-controller-next-track
   "pd" 'package-delete
   "pt" 'smudge-controller-previous-track
   "rg" 'consult-ripgrep
   "ss" 'smudge-controller-toggle-shuffle
   "t" 'treemacs))

(provide 'sethen-general)
