;;; init.el --- Initialization of Emacs -*- lexical-binding: t -*-

;; Author: sethen
;; Maintainer: sethen


;; This file is not part of GNU Emacs

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.


;;; Commentary:


;;; Code:

(add-to-list 'load-path (concat user-emacs-directory "/lisp/constants"))
(add-to-list 'load-path (concat user-emacs-directory "/lisp/global"))
(add-to-list 'load-path (concat user-emacs-directory "/lisp/hooks"))
(add-to-list 'load-path (concat user-emacs-directory "/lisp/lib"))
(add-to-list 'load-path (concat user-emacs-directory "/lisp/packages"))

(setq custom-file (concat user-emacs-directory "emacs-custom.el"))

;; global
(require 'sethen-repositories)
(require 'sethen-use-package)

(require 'sethen-themes)
(require 'sethen-fonts)
(require 'sethen-preferences)
(require 'sethen-user-interface)

;; snippets
;; needs to be installed first for company
(require 'sethen-yasnippet)
(require 'sethen-yasnippet-snippets)

;; auto-complete
(require 'sethen-company)
(require 'sethen-company-posframe)

;; colors
(require 'sethen-rainbow-mode)

;; csharp
(require 'sethen-csharp-mode)

;; dashboard
(require 'sethen-dashboard)

;; diagnostics
(require 'sethen-flycheck)
(require 'sethen-flycheck-posframe)

;; docker
(require 'sethen-dockerfile-mode)

;; docs
(require 'sethen-helpful)
(require 'sethen-marginalia)

;; evil
(require 'sethen-evil)
(require 'sethen-evil-collection)

;; formatting
(require 'sethen-electric-pair-mode)
(require 'sethen-indentation)
(require 'sethen-ligatures)
(require 'sethen-hl-block-mode)

;; git
(require 'sethen-git-gutter)
(require 'sethen-magit)

;; keybindings
(require 'sethen-embark)
(require 'sethen-general)

;; lsp
(require 'sethen-lsp-mode)
(require 'sethen-lsp-ui)

;; go
(require 'sethen-go-mode)

;; modes
(require 'sethen-web-mode)

;; navigation
(require 'sethen-consult)
(require 'sethen-embark-consult)
(require 'sethen-highlight-mode)
(require 'sethen-orderless)
(require 'sethen-treemacs)
(require 'sethen-treemacs-evil)
(require 'sethen-vertico)
(require 'sethen-which-key)

;; numbers
(require 'sethen-literate-calc-mode)

;; modeline
(require 'sethen-doom-modeline)

;; music
(require 'sethen-smudge)

;; rust
(require 'sethen-rust-mode)

;; shell
(require 'sethen-exec-path-from-shell)

;; syntax
(require 'sethen-rainbow-delimiters)

;; typescript
(require 'sethen-typescript-mode)

;; whitespace
(require 'sethen-whitespace)

;; yaml
(require 'sethen-yaml-mode)

;; csharp
(require 'sethen-csharp-mode-hook)

;; css
(require 'sethen-css-mode-hook)

;; emacs lisp
(require 'sethen-emacs-lisp-mode-hook)

;; javascript
(require 'sethen-js-mode-hook)

;; lsp mode
(require 'sethen-lsp-mode-hook)

;; golang
(require 'sethen-go-mode-hook)

;; markdown
(require 'sethen-markdown-mode-hook)

;; minibuffer
(require 'sethen-minibuffer-setup-hook)

;; python
(require 'sethen-python-mode-hook)

;; ruby
(require 'sethen-ruby-mode-hook)
(require 'sethen-chruby)

;; rust
(require 'sethen-rust-mode-hook)

;; typescript
(require 'sethen-typescript-mode-hook)

;; prog mode
(require 'sethen-prog-mode-hook)

;; text mode
(require 'sethen-text-mode-hook)

;; typescript
(require 'sethen-typescript-mode-hook)

;; web mode
(require 'sethen-web-mode-hook)

(provide 'init)

;;; init.el ends here
