;;; Initial Setup

;; Load Path
(add-to-list 'load-path (concat user-emacs-directory "lisp/hooks"))
(add-to-list 'load-path (concat user-emacs-directory "lisp/packages"))
(add-to-list 'load-path (concat user-emacs-directory "lisp/preferences"))
(add-to-list 'load-path (concat user-emacs-directory "lisp/repositories"))

;; Custom File
(setq custom-file (concat user-emacs-directory "emacs-custom.el"))

;; Repositories
(require 'sethen-melpa)

;; Macros
(require 'sethen-use-package)

;;; Additional Setup

;; Auto Completion
(require 'sethen-corfu)
(require 'sethen-cape)

;; Buffer
(require 'sethen-buffer)

;; Colors
(require 'sethen-rainbow-mode)
(require 'sethen-rainbow-delimiters)

;; Dashboard
(require 'sethen-dashboard)

;; Docker
(require 'sethen-dockerfile-mode)

;; Documentation
(require 'sethen-marginalia)

;; Environment
(require 'sethen-exec-path-from-shell)

;; File
(require 'sethen-file)

;; Git
(require 'sethen-git-gutter)
(require 'sethen-git-modes)
(require 'sethen-magit)

;; Go
(require 'sethen-go-mode)

;; JSON
(require 'sethen-json-mode)

;; LSP
(require 'sethen-lsp-mode)
(require 'sethen-lsp-ui)

;; Navigation
(require 'sethen-orderless)
(require 'sethen-treemacs)
(require 'sethen-vertico)

;; Key Bindings
(require 'sethen-evil)
(require 'sethen-evil-collection)
(require 'sethen-treemacs-evil)
(require 'sethen-which-key)

;; Ruby
(require 'sethen-chruby)

;; Rust
(require 'sethen-rust-mode)

;; Symbols
(require 'sethen-ligature)

;; Syntax
(require 'sethen-tree-sitter)
(require 'sethen-tree-sitter-langs)

;; Themes
(require 'sethen-doom-modeline)
(require 'sethen-doom-themes)

;; Typescript
(require 'sethen-typescript-mode)

;; Web
(require 'sethen-web-mode)

;; YAML
(require 'sethen-yaml-mode)

;; Preferences
(require 'sethen-electric-pair-mode)
(require 'sethen-fonts)
(require 'sethen-gui)
(require 'sethen-indentation)
(require 'sethen-line-numbers)
(require 'sethen-whitespace)

;; Hooks
(require 'sethen-css-mode-hook)
(require 'sethen-dockerfile-mode-hook)
(require 'sethen-go-mode-hook)
(require 'sethen-js-mode-hook)
(require 'sethen-json-mode-hook)
(require 'sethen-lsp-completion-mode-hook)
(require 'sethen-prog-mode-hook)
(require 'sethen-python-mode-hook)
(require 'sethen-ruby-mode-hook)
(require 'sethen-rust-mode-hook)
(require 'sethen-sh-mode-hook)
(require 'sethen-typescript-mode-hook)
(require 'sethen-yaml-mode-hook)

(provide 'sethen-init)
