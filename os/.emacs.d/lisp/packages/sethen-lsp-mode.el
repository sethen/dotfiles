;;; sethen-lsp-mode.el --- LSP Mode settings -*- lexical-binding: t -*-

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

;; LSP Mode package for lsp

;;; Code:

(require 'use-package)

(use-package lsp-mode
  :config
  (setq gc-cons-threshold 100000000
	lsp-eslint-auto-fix-on-save t
	lsp-idle-delay 0.500
	read-process-output-max (* 1024 1024))
  (lsp-ensure-server 'css-ls)
  (lsp-ensure-server 'dockerfile-ls)
  (lsp-ensure-server 'eslint)
  (lsp-ensure-server 'html-ls)
  (lsp-ensure-server 'json-ls)
  (lsp-ensure-server 'lua-language-server)
  (lsp-ensure-server 'omnisharp)
  (lsp-ensure-server 'rust-analyzer)
  (lsp-ensure-server 'ts-ls)
  (lsp-ensure-server 'yamlls)
  :commands (lsp-ensure-server)
  :defines (lsp-eslint-auto-fix-on-save))

(provide 'sethen-lsp-mode)

;;; sethen-lsp-mode.el ends here
