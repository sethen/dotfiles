(require 'use-package)

(use-package general
  :commands (general-define-key)
  :init
  (general-define-key
   :prefix "C-c"
   "cb" 'consult-buffer
   "cf" 'consult-fd
   "cl" 'consult-line
   "cm" 'consult-man
   "df" 'describe-function
   "dp" 'describe-package
   "dv" 'describe-variable
   "hf" 'helpful-function
   "hv" 'helpful-variable
   "im" 'consult-imenu
   "mg" 'magit
   "rg" 'consult-ripgrep
   "sn" 'smudge-controller-next-track
   "sp" 'smudge-controller-previous-track
   "stp" 'smudge-controller-toggle-play
   "ss" 'smudge-controller-toggle-shuffle
   "t" 'treemacs))

(provide 'sethen-general)
