;; Package Managers
(add-to-list 'load-path (concat user-emacs-directory "elisp/packages/package-managers"))

(require 'sethen-elpaca)
(require 'sethen-elpaca-use-package)

;; Themes
;;; Load themes early
(add-to-list 'load-path (concat user-emacs-directory "elisp/packages/themes"))

(require 'sethen-doom-modeline)
(require 'sethen-doom-themes)

;; Navigation
;;; Load navigation early
(add-to-list 'load-path (concat user-emacs-directory "elisp/packages/navigation"))

(require 'sethen-evil)
(require 'sethen-evil-collection)
(require 'sethen-dashboard)

;; Tree
;;; Load tree early
(add-to-list 'load-path (concat user-emacs-directory "elisp/packages/tree"))

(require 'sethen-treemacs)
(require 'sethen-treemacs-evil)

;; Autocomplete
(add-to-list 'load-path (concat user-emacs-directory "elisp/packages/autocomplete"))

(require 'sethen-cape)
(require 'sethen-corfu)
(require 'sethen-company-web)
(require 'sethen-company-nginx)

;; Colors
(add-to-list 'load-path (concat user-emacs-directory "elisp/packages/colors"))

(require 'sethen-material)
(require 'sethen-rainbow-delimiters)
(require 'sethen-rainbow-mode)

;; Documentation
(add-to-list 'load-path (concat user-emacs-directory "elisp/packages/documentation"))

(require 'sethen-helpful)
(require 'sethen-marginalia)

;; Environment
(add-to-list 'load-path (concat user-emacs-directory "elisp/packages/environment"))

(require 'sethen-exec-path-from-shell)

;; Errors
(add-to-list 'load-path (concat user-emacs-directory "elisp/packages/errors"))

(require 'sethen-flycheck)
(require 'sethen-flycheck-posframe)

;; Fonts
(add-to-list 'load-path (concat user-emacs-directory "elisp/packages/fonts"))

(require 'sethen-ligature)

;; Git
(add-to-list 'load-path (concat user-emacs-directory "elisp/packages/git"))

(require 'sethen-git-gutter)
(require 'sethen-magit)

;; Langs
(add-to-list 'load-path (concat user-emacs-directory "elisp/packages/langs"))

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
(add-to-list 'load-path (concat user-emacs-directory "elisp/packages/lsp"))

(require 'sethen-lsp-mode)
(require 'sethen-lsp-ui)

;; Preferences
(add-to-list 'load-path (concat user-emacs-directory "elisp/packages/preferences"))

(require 'sethen-buffer)
(require 'sethen-electric-pair-mode)
(require 'sethen-file)
(require 'sethen-fonts)
(require 'sethen-gui)
(require 'sethen-line-numbers)
(require 'sethen-whitespace)

;; Search
(add-to-list 'load-path (concat user-emacs-directory "elisp/packages/search"))

(require 'sethen-consult)
(require 'sethen-orderless)
(require 'sethen-vertico)

;; Syntax
(add-to-list 'load-path (concat user-emacs-directory "elisp/packages/syntax"))

(require 'sethen-hl-block-mode)

;; Text
(add-to-list 'load-path (concat user-emacs-directory "elisp/packages/text"))

(require 'sethen-gh-md)
(require 'sethen-markdown-mode)

;; Tools
(add-to-list 'load-path (concat user-emacs-directory "elisp/packages/tools"))

(require 'sethen-chruby)
(require 'sethen-general)
(require 'sethen-json-reformat)
(require 'sethen-which-key)

;; Hooks
(add-to-list 'load-path (concat user-emacs-directory "elisp/hooks"))

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
(require 'sethen-window-setup-hook)
(require 'sethen-yaml-mode-hook)
