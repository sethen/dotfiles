;;; Initial Setup

;; Load Path
(add-to-list 'load-path (concat user-emacs-directory "lisp/packages"))
(add-to-list 'load-path (concat user-emacs-directory "lisp/preferences"))
(add-to-list 'load-path (concat user-emacs-directory "lisp/repositories"))

;; Custom File
(setq custom-file (concat user-emacs-directory "emacs-custom.el"))

;; Repositories
(require 'sethen-melpa)

;; Macros
(require 'sethen-use-package)

;; Preferences
(require 'sethen-electric-pair-mode)
(require 'sethen-fonts)
(require 'sethen-line-numbers)

;;; Additional Setup

;; Navigation
(require 'sethen-treemacs)

;; Key Bindings
(require 'sethen-evil)
(require 'sethen-evil-collection)
(require 'sethen-treemacs-evil)

;; Themes
(require 'sethen-doom-themes)

(provide 'sethen-init)
