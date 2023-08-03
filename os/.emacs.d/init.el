(toggle-frame-maximized)

;; Preferences
(add-to-list 'load-path (concat user-emacs-directory "elisp/preferences"))

(require 'sethen-buffer)
(require 'sethen-electric-pair-mode)
(require 'sethen-file)
(require 'sethen-fonts)
(require 'sethen-gui)
(require 'sethen-line-numbers)
(require 'sethen-whitespace)

;; Packages
(add-to-list 'load-path (concat user-emacs-directory "elisp/packages"))

;; Package Managers
(require 'sethen-elpaca)
(require 'sethen-elpaca-use-package)

;; Themes
;;; Load themes early
(require 'sethen-doom-modeline)
(require 'sethen-doom-themes)

;; Navigation
;;; Load navigation early
(require 'sethen-evil)
(require 'sethen-evil-collection)
(require 'sethen-centaur-tabs)
(require 'sethen-dashboard)
(require 'sethen-treemacs)
(require 'sethen-treemacs-evil)

;; Autocomplete
(require 'sethen-cape)
(require 'sethen-corfu)
(require 'sethen-company-web)
(require 'sethen-company-nginx)

;; Colors
(require 'sethen-material)
(require 'sethen-rainbow-delimiters)
(require 'sethen-rainbow-mode)

;; Documentation
(require 'sethen-helpful)
(require 'sethen-marginalia)

;; Environment
(require 'sethen-exec-path-from-shell)

;; Errors
(require 'sethen-flycheck)
(require 'sethen-flycheck-posframe)

;; Fonts
(require 'sethen-ligature)

;; Git
(require 'sethen-git-gutter)
(require 'sethen-magit)

;; Langs
(require 'sethen-dockerfile-mode)
(require 'sethen-git-modes)
(require 'sethen-go-mode)
(require 'sethen-json-mode)
(require 'sethen-nginx-mode)
(require 'sethen-rust-mode)
(require 'sethen-tide-mode)
(require 'sethen-typescript-mode)
(require 'sethen-web-mode)
(require 'sethen-yaml-mode)

;; LSP
(require 'sethen-lsp-mode)
(require 'sethen-lsp-ui)

;; Search
(require 'sethen-consult)
(require 'sethen-orderless)
(require 'sethen-vertico)

;; Sound
(require 'sethen-smudge)

;; Text
(require 'sethen-gh-md)
(require 'sethen-markdown-mode)

;; Tools
(require 'sethen-chruby)
(require 'sethen-general)
(require 'sethen-json-reformat)
(require 'sethen-which-key)

(add-to-list 'load-path (concat user-emacs-directory "elisp/hooks"))

;; Hooks
(require 'sethen-css-mode-hook)
(require 'sethen-dockerfile-mode-hook)
(require 'sethen-go-mode-hook)
(require 'sethen-js-mode-hook)
(require 'sethen-json-mode-hook)
(require 'sethen-lsp-completion-mode-hook)
(require 'sethen-markdown-mode-hook)
(require 'sethen-prog-mode-hook)
(require 'sethen-ruby-mode-hook)
(require 'sethen-rust-mode-hook)
(require 'sethen-sh-mode-hook)
(require 'sethen-typescript-mode-hook)
(require 'sethen-web-mode-hook)
(require 'sethen-yaml-mode-hook)

(require 'use-package)
