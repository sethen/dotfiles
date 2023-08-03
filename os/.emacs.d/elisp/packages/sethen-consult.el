(require 'use-package)

(use-package consult
  :custom
  (consult-ripgrep-args "rg --hidden --null --line-buffered --color=never --max-columns=1000 --path-separator /\
   --smart-case --no-heading --with-filename --line-number --search-zip")
  (consult-find-args "find . -not -path './.git/*'"))

(provide 'sethen-consult)
