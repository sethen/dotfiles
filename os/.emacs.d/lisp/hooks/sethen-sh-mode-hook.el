;;; sethen-sh-mode-hook.el --- Sh Mode hook settings -*- lexical-binding: t -*-

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

;; Sh Mode Hook for shell scripts

;;; Code:

(require 'lsp)
(require 'tree-sitter)

(defun sethen-sh-mode-hook ()
  "Prod Mode hook settings!"
  (lsp-deferred)
  (tree-sitter-hl-mode))

(add-hook 'sh-mode-hook 'sethen-sh-mode-hook)

(provide 'sethen-sh-mode-hook)

;;; sethen-sh-mode-hook.el ends here
