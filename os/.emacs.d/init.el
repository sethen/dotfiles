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

(add-to-list 'load-path (concat user-emacs-directory "/lisp/packages"))
(add-to-list 'load-path (concat user-emacs-directory "/lisp/hooks"))
(add-to-list 'load-path (concat user-emacs-directory "/lisp/utilities"))

(setq custom-file (concat user-emacs-directory "emacs-custom.el"))

(require 'sethen-repositories)
(require 'sethen-global)
(require 'sethen-use-package)
(require 'sethen-user-interface)
(require 'sethen-fonts)
(require 'sethen-editor)

(require 'sethen-themes)

;; auto-complete
(require 'sethen-company)

;; colors
(require 'sethen-rainbow-mode)

;; diagnostics
(require 'sethen-flycheck)

;; git
(require 'sethen-git-gutter)

;; lsp
(require 'sethen-lsp-mode)
(require 'sethen-lsp-ui)

;; modes
(require 'sethen-web-mode)

;; navigation
(require 'sethen-vertico)
(require 'sethen-orderless)
(require 'sethen-consult)
(require 'sethen-treemacs)
(require 'sethen-treemacs-evil)

;; snippets
(require 'sethen-yasnippet)
(require 'sethen-yasnippet-snippets)

;; typescript
(require 'sethen-typescript-mode)

;; vim
(require 'sethen-evil)

;; hooks
(require 'sethen-css-mode-hook)
(require 'sethen-emacs-lisp-mode-hook)
(require 'sethen-js-mode-hook)
(require 'sethen-lsp-mode-hook)
(require 'sethen-typescript-mode-hook)
(require 'sethen-web-mode-hook)

;;; init.el ends here
