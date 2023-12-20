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
(require 'sethen-company)
(require 'sethen-company-posframe)
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

(require 'sethen-coverlay)
(require 'sethen-origami)

;; Langs
(require 'sethen-dockerfile-mode)
(require 'sethen-git-modes)
(require 'sethen-css-in-js-mode)
(require 'sethen-go-mode)
(require 'sethen-json-mode)
(require 'sethen-nginx-mode)
(require 'sethen-rust-mode)
(require 'sethen-tsx-mode)
(require 'sethen-yaml-mode)

;; LSP
(require 'sethen-lsp-mode)
(require 'sethen-lsp-ui)

;; Project
(require 'sethen-projectile)

;; Search
(require 'sethen-consult)
(require 'sethen-embark)
(require 'sethen-embark-consult)
(require 'sethen-orderless)
(require 'sethen-vertico)

;; Sound
(require 'sethen-smudge)

;; Syntax
;;(require 'sethen-tree-sitter)
;;(require 'sethen-tree-sitter-langs)

;; Text
(require 'sethen-gh-md)
(require 'sethen-markdown-mode)
(require 'sethen-wgrep)

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
(require 'sethen-yaml-mode-hook)
