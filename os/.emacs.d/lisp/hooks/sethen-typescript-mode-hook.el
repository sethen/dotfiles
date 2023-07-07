;;; sethen-typescript-mode-hook.el --- Typescript Mode hook settings -*- lexical-binding: t -*-

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

;; Typescript Mode Hook for typescript

;;; Code:

(require 'tree-sitter)

(defun sethen-typescript-mode-hook ()
  "Prod Mode hook settings!"
  (tree-sitter-hl-mode))

(add-hook 'typescript-mode-hook 'sethen-typescript-mode-hook)

(provide 'sethen-typescript-mode-hook)

;;; sethen-typescript-mode-hook.el ends here
