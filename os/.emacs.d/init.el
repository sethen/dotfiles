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

;; Colors
(require 'sethen-rainbow-mode)
(require 'sethen-rainbow-delimiters)

;; Dashboard
(require 'sethen-dashboard)

;; Documentation
(require 'sethen-marginalia)

;; Git
(require 'sethen-git-gutter)

;; Navigation
(require 'sethen-orderless)
(require 'sethen-treemacs)
(require 'sethen-vertico)

;; Key Bindings
(require 'sethen-evil)
(require 'sethen-evil-collection)
(require 'sethen-treemacs-evil)
(require 'sethen-which-key)

;; Symbols
(require 'sethen-ligature)

;; Syntax
(require 'sethen-tree-sitter)
(require 'sethen-tree-sitter-langs)

;; Themes
(require 'sethen-doom-modeline)
(require 'sethen-doom-themes)

;; Preferences
(require 'sethen-electric-pair-mode)
(require 'sethen-fonts)
(require 'sethen-gui)
(require 'sethen-line-numbers)
(require 'sethen-whitespace)

;; Hooks
(require 'sethen-js-mode-hook)
(require 'sethen-prog-mode-hook)

(provide 'sethen-init)
