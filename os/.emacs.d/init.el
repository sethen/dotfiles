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

(add-to-list 'load-path (concat user-emacs-directory "/lisp/hooks"))
(add-to-list 'load-path (concat user-emacs-directory "/lisp/packages"))

(setq custom-file (concat user-emacs-directory "emacs-custom.el"))

(require 'sethen-repositories)
(require 'sethen-global)
(require 'sethen-use-package)
(require 'sethen-user-interface)
(require 'sethen-fonts)
(require 'sethen-themes)
(require 'sethen-general)

;; auto-complete
(require 'sethen-company)
;;(require 'sethen-company-posframe)

;; colors
(require 'sethen-rainbow-mode)

;; dashboard
(require 'sethen-dashboard)

;; diagnostics
(require 'sethen-flycheck)
(require 'sethen-flycheck-posframe)

;; formatting
(require 'sethen-electric-pair-mode)
(require 'sethen-indentation)

;; git
(require 'sethen-git-gutter)
(require 'sethen-magit)

;; lsp
(require 'sethen-lsp-mode)
(require 'sethen-lsp-ui)

;; modes
(require 'sethen-web-mode)

;; navigation
(require 'sethen-consult)
(require 'sethen-highlight-mode)
(require 'sethen-orderless)
(require 'sethen-treemacs)
(require 'sethen-treemacs-evil)
(require 'sethen-vertico)
(require 'sethen-which-key)

;; numbers
(require 'sethen-literate-calc-mode)

;; snippets
(require 'sethen-yasnippet)
(require 'sethen-yasnippet-snippets)

;; syntax
(require 'sethen-rainbow-delimiters)

;; typescript
(require 'sethen-typescript-mode)

;; vim
(require 'sethen-evil)

;; whitespace
(require 'sethen-whitespace)

;; hooks
(require 'sethen-css-mode-hook)
(require 'sethen-emacs-lisp-mode-hook)
(require 'sethen-js-mode-hook)
(require 'sethen-lsp-mode-hook)
(require 'sethen-markdown-mode-hook)
(require 'sethen-minibuffer-setup-hook)
(require 'sethen-typescript-mode-hook)
(require 'sethen-prog-mode-hook)
(require 'sethen-text-mode-hook)
(require 'sethen-typescript-mode-hook)
(require 'sethen-web-mode-hook)

;;; init.el ends here
