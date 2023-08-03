(require 'use-package)

(use-package exec-path-from-shell
  :commands (exec-path-from-shell-initialize)
  :init (exec-path-from-shell-initialize))

(provide 'sethen-exec-path-from-shell)
