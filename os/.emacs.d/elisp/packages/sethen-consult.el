(require 'use-package)

(use-package consult
  :custom
  (consult-ripgrep-args "rg --hidden --null --line-buffered --color=never --max-columns=1000 --path-separator /\
   --smart-case --no-heading --with-filename --line-number --search-zip")
  (consult-fd-args '((if (executable-find "fdfind" 'remote) "fdfind" "fd") "--full-path --color=never -H")))

(provide 'sethen-consult)
