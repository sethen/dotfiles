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

;;; Directories:
(add-to-list 'load-path (concat user-emacs-directory "/lisp/constants"))
(add-to-list 'load-path (concat user-emacs-directory "/lisp/global"))
(add-to-list 'load-path (concat user-emacs-directory "/lisp/hooks"))
(add-to-list 'load-path (concat user-emacs-directory "/lisp/lib"))
(add-to-list 'load-path (concat user-emacs-directory "/lisp/packages"))

;;; Custom File:
(setq custom-file (concat user-emacs-directory "emacs-custom.el"))

;;; Global Packages:
(require 'sethen-melpa)
(require 'sethen-use-package)
(require 'sethen-electric-pair-mode)
(require 'sethen-fonts)
(require 'sethen-gui)
(require 'sethen-indentation)
(require 'sethen-themes)
(require 'sethen-whitespace)

;;; Auto Complete:
(require 'sethen-yasnippet)
(require 'sethen-yasnippet-snippets)
(require 'sethen-company)
(require 'sethen-company-posframe)

;; Code UI:
(require 'sethen-ligatures)
(require 'sethen-hl-block-mode)
(require 'sethen-rainbow-mode)
(require 'sethen-rainbow-delimiters)

;;; Diagnostics:
(require 'sethen-flycheck)
(require 'sethen-flycheck-posframe)

;;; Documentation:
(require 'sethen-helpful)
(require 'sethen-marginalia)

;;; Emacs UI:
(require 'sethen-consult)
(require 'sethen-dashboard)
(require 'sethen-doom-modeline)
(require 'sethen-embark-consult)
(require 'sethen-orderless)
(require 'sethen-treemacs)
(require 'sethen-treemacs-evil)
(require 'sethen-vertico)
(require 'sethen-which-key)

;; Git:
(require 'sethen-git-gutter)
(require 'sethen-magit)

;;; Languages:
(require 'sethen-csharp-mode)
(require 'sethen-dockerfile-mode)
(require 'sethen-go-mode)
(require 'sethen-rust-mode)
(require 'sethen-typescript-mode)
(require 'sethen-yaml-mode)
(require 'sethen-web-mode)

;; Language Server:
(require 'sethen-lsp-mode)
(require 'sethen-lsp-ui)

;; Keybindings:
(require 'sethen-embark)
(require 'sethen-general)

;;; Music:
(require 'sethen-smudge)

;; Numbers:
(require 'sethen-literate-calc-mode)

;;; Replace:
(require 'sethen-wgrep)

;;; Shell:
(require 'sethen-exec-path-from-shell)

;;; Vim:
(require 'sethen-evil)
(require 'sethen-evil-collection)

;;; Hooks:
(require 'sethen-csharp-mode-hook)
(require 'sethen-css-mode-hook)
(require 'sethen-emacs-lisp-mode-hook)
(require 'sethen-js-mode-hook)
(require 'sethen-lsp-mode-hook)
(require 'sethen-go-mode-hook)
(require 'sethen-markdown-mode-hook)
(require 'sethen-minibuffer-setup-hook)
(require 'sethen-python-mode-hook)
(require 'sethen-ruby-mode-hook)
(require 'sethen-chruby)
(require 'sethen-rust-mode-hook)
(require 'sethen-typescript-mode-hook)
(require 'sethen-prog-mode-hook)
(require 'sethen-text-mode-hook)
(require 'sethen-typescript-mode-hook)
(require 'sethen-web-mode-hook)

;; Preferences:
(require 'sethen-preferences)

(provide 'init)

;;; init.el ends here
