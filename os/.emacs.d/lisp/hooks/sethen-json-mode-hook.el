;;; sethen-json-mode-hook.el --- JSON Mode Hook settings -*- lexical-binding: t -*-

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

;; JSON Mode Hook for json

;;; Code:

(require 'lsp)
(require 'tree-sitter)

(defun sethen-json-mode-hook ()
  "JSON Mode Hook settings!"
  (lsp-deferred)
  (tree-sitter-hl-mode))

(add-hook 'json-mode-hook 'sethen-json-mode-hook)

(provide 'sethen-json-mode-hook)

;;; sethen-json-mode-hook.el ends here
