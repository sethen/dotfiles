;;; sethen-global-lib.el --- Global lib -*- lexical-binding: t -*-

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

(defun sethen-is-buffer-name (buf)
  "Is current buffer?"
  (if (string= (buffer-name) buf)
	  t
	nil))

(defun sethen-is-buffer-name-dashboard ()
  "Is buffer name dashboard"
  (sethen-is-buffer-name "*dashboard*"))

(defun sethen-is-buffer-name-help ()
  "Is current buffer help"
  (sethen-is-buffer-name "*Help*"))

(defun sethen-is-buffer-name-scratch ()
  "Is current buffer scratch"
  (sethen-is-buffer-name "*scratch*"))

(defun sethen-is-buffer-name-ignored ()
  "Is current buffer ignored"
  (or (sethen-is-buffer-name-dashboard)
	  (sethen-is-buffer-name-help)
	  (sethen-is-buffer-name-scratch)))

(provide 'sethen-global-lib)

;;; sethen-global-lib.el ends here
