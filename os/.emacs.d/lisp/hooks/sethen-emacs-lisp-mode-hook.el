;;; sethen-emacs-lisp-mode-hook.el --- Emacs Lisp Mode hook settings -*- lexical-binding: t -*-

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

(require 'ligature)
(require 'rainbow-delimiters)

(defvar company-backends)

(defun sethen/emacs-lisp-mode-hook()
  "Emacs Lisp Mode hook settings!"
  (ligature-mode)
  (rainbow-delimiters-mode)
  (setq-local company-backends '(company-capf company-keywords company-files company-yasnippet)))

(add-hook 'emacs-lisp-mode-hook 'sethen/emacs-lisp-mode-hook)

(provide 'sethen-emacs-lisp-mode-hook)

;;; sethen-emacs-lisp-mode-hook.el ends here
