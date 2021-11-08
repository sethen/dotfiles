;;; sethen-modeline-lib.el --- Modeline lib -*- lexical-binding: t -*-

;; Author: sethen
;; Maintainer: sethen


;; This file is not part of GNU Emacs
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by ;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.


;;; Commentary:


;;; Code:

(require 'evil)
(require 'material-colors)
(require 'sethen-global-lib)

(defface buffer-name-colors `((t (:background ,material-grey-three :foreground ,material-white))) "")
(defface insert-mode-colors `((t (:background ,material-green :foreground ,material-grey-one))) "")
(defface normal-mode-colors `((t (:background ,material-blue-two :foreground ,material-grey-one))) "")
(defface replace-mode-colors `((t (:background ,material-red-one :foreground ,material-grey-one))) "")
(defface visual-mode-colors `((t (:background ,material-purple :foreground ,material-grey-one))) "")

(defun sethen-get-buffer-name()
  "Get buffer name!"
  (cond
   ((sethen-is-buffer-name-dashboard) (propertize "  " 'face 'buffer-name-colors))
   ((sethen-is-buffer-name-help) (propertize "  " 'face 'buffer-name-colors))
   ((sethen-is-buffer-name-scratch) (propertize "  " 'face 'buffer-name-colors))
   (t (propertize " %b " 'face 'buffer-name-colors))))

(defun sethen-get-evil-state ()
  "Get evil state!"
  (cond
   ((sethen-is-buffer-name-ignored))
   ((eq evil-state 'insert) (propertize " INSERT " 'face 'insert-mode-colors))
   ((eq evil-state 'normal) (propertize " NORMAL " 'face 'normal-mode-colors))
   ((eq evil-state 'replace) (propertize " REPLACE " 'face 'replace-mode-colors))
   ((eq evil-state 'visual) (propertize " VISUAL " 'face 'visual-mode-colors))))

(defun sethen-get-percentage-of-buffer ()
  "Get percentage of buffer!"
  (cond
   ((sethen-is-buffer-name-ignored))
   (t '(" %q "))))

(provide 'sethen-modeline-lib)

;;; sethen-modeline-lib.el ends here
