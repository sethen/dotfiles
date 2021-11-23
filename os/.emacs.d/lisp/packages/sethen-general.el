;;; sethen-general.el --- General settings -*- lexical-binding: t -*-

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

(require 'use-package)

(use-package general
  :commands
  (general-define-key)
  :init
  (general-define-key
   :prefix "C-c"
   "cb" 'consult-buffer
   "cf" 'consult-find
   "cl" 'consult-line
   "cm" 'consult-man
   "dp" 'describe-package
   "hf" 'helpful-function
   "hv" 'helpful-variable
   "mg" 'magit-status
   "nt" 'smudge-controller-next-track
   "pd" 'package-delete
   "pt" 'smudge-controller-previous-track
   "rg" 'consult-ripgrep
   "ss" 'smudge-controller-toggle-shuffle
   "t" 'treemacs))

(provide 'sethen-general)
;;; sethen-general.el ends here
