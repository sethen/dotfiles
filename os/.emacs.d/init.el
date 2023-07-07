;;; Initial Setup

;; Load Path
(add-to-list 'load-path (concat user-emacs-directory "lisp/packages"))

;; Custom File
(setq custom-file (concat user-emacs-directory "emacs-custom.el"))

;; Repositories
(require 'sethen-melpa)

;; Macros
(require 'sethen-use-package)

;;; Additional Setup

;; Navigation
(require 'sethen-treemacs)

;; Key Bindings
(require 'sethen-evil)
(require 'sethen-evil-collection)
(require 'sethen-treemacs-evil)

(provide 'sethen-init)
