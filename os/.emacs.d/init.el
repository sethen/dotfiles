;;;
;;; Cores
;;;

;; Package Managers
(add-to-list 'load-path (concat user-emacs-directory "elisp/cores/package-managers"))

(require 'core-elpaca)
(require 'core-elpaca-use-package)

;; Themes
(add-to-list 'load-path (concat user-emacs-directory "elisp/cores/themes"))

(require 'core-doom-modeline)
(require 'core-doom-themes)

;; Colors
(add-to-list 'load-path (concat user-emacs-directory "elisp/cores/colors"))

(require 'core-material)
(require 'core-rainbow-delimiters)
(require 'core-rainbow-mode)

;; Documentation
(add-to-list 'load-path (concat user-emacs-directory "elisp/cores/documentation"))

(require 'core-helpful)
(require 'core-marginalia)

;; Errors
(add-to-list 'load-path (concat user-emacs-directory "elisp/cores/errors"))

(require 'core-flycheck)
(require 'core-flycheck-posframe)

;; Environment
(add-to-list 'load-path (concat user-emacs-directory "elisp/cores/environment"))

(require 'core-exec-path-from-shell)

;; Fonts
(add-to-list 'load-path (concat user-emacs-directory "elisp/cores/fonts"))

(require 'core-ligature)

;; Git
(add-to-list 'load-path (concat user-emacs-directory "elisp/cores/git"))

(require 'core-git-gutter)

;; Navigation
(add-to-list 'load-path (concat user-emacs-directory "elisp/cores/navigation"))

(require 'core-evil)
(require 'core-evil-collection)
(require 'core-hl-block-mode)
(require 'core-treemacs)
(require 'core-treemacs-evil)
(require 'core-vertico)

;; Preferences
(add-to-list 'load-path (concat user-emacs-directory "elisp/cores/preferences"))

(require 'core-buffer)
(require 'core-electric-pair-mode)
(require 'core-file)
(require 'core-fonts)
(require 'core-gui)
(require 'core-line-numbers)
(require 'core-whitespace)

;; Hooks
(add-to-list 'load-path (concat user-emacs-directory "elisp/cores/hooks"))

(require 'core-prog-mode-hook)
(require 'core-window-setup-hook)

;;;
;;; Layers
;;;

;; Autocomplete
(add-to-list 'load-path (concat user-emacs-directory "elisp/layers/autocomplete"))

(require 'layer-company)
(require 'layer-company-posframe)
(require 'layer-company-nginx)
(require 'layer-company-web)

;; Git
(add-to-list 'load-path (concat user-emacs-directory "elisp/layers/git"))

(require 'layer-magit)

;; Langs
(add-to-list 'load-path (concat user-emacs-directory "elisp/layers/langs"))

(require 'layer-dockerfile-mode)
(require 'layer-git-modes)
(require 'layer-json-mode)
(require 'layer-nginx-mode)
(require 'layer-rust-mode)
(require 'layer-web-mode)
(require 'layer-yaml-mode)

;; LSP
(add-to-list 'load-path (concat user-emacs-directory "elisp/layers/lsp"))

(require 'layer-lsp-mode)
(require 'layer-lsp-ui)

;; Navigation
(add-to-list 'load-path (concat user-emacs-directory "elisp/layers/navigation"))

(require 'layer-dashboard)
(require 'layer-which-key)

;; Text
(add-to-list 'load-path (concat user-emacs-directory "elisp/layers/text"))

(require 'layer-gh-md)
(require 'layer-markdown-mode)

;; Tools
(add-to-list 'load-path (concat user-emacs-directory "elisp/layers/tools"))

(require 'layer-chruby)
(require 'layer-json-reformat)

;; Hooks
(add-to-list 'load-path (concat user-emacs-directory "elisp/layers/hooks"))

(require 'layer-css-mode-hook)
(require 'layer-js-mode-hook)
(require 'layer-markdown-mode-hook)
(require 'layer-ruby-mode-hook)
(require 'layer-rust-mode-hook)
(require 'layer-web-mode-hook)
(require 'layer-yaml-mode-hook)
