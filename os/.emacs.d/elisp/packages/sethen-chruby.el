(require 'use-package)

(use-package chruby
  :commands (chruby)
  :config (exec-path-from-shell-copy-env "RUBY_VERSION")
  :init (chruby (concat "ruby-" (getenv "RUBY_VERSION"))))

(provide 'sethen-chruby)
