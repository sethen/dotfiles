;;; sethen-modeline.el --- Modeline settings -*- lexical-binding: t -*-

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


;;; code:

(require 'material-colors)

(defun sethen-is-buffer-name (buf)
  "Is BUF the current buffer?"
  (if (string= (buffer-name) buf)
	  t
	nil))

(defun sethen-is-buffer-name-dashboard ()
  "Is buffer name dashboard?"
  (sethen-is-buffer-name "*dashboard*"))

(defun sethen-is-buffer-name-help ()
  "Is current buffer help?"
  (sethen-is-buffer-name "*Help*"))

(defun sethen-is-buffer-name-scratch ()
  "Is current buffer scratch?"
  (sethen-is-buffer-name "*scratch*"))

(defun sethen-is-buffer-name-ignored ()
  "Is current buffer ignored?"
  (or (sethen-is-buffer-name-dashboard)
	  (sethen-is-buffer-name-help)
	  (sethen-is-buffer-name-scratch)))
(defun sethen-get-percentage-of-buffer ()
  "Get percentage of buffer!"
  (cond
   ((sethen-is-buffer-name-ignored))
   (t '(" %q "))))

(defface buffer-name-colors
  `((t (:background ,material-grey-three :foreground ,material-white)))
  "Buffer name colors!"
  :group 'sethen)

(defface git-name-colors
  `((t (:foreground ,material-white)))
  "Buffer name colors!"
  :group 'sethen)

(defface insert-mode-colors
  `((t (:background ,material-green :foreground ,material-grey-one)))
  "Insert mode colors!"
  :group 'sethen)

(defface normal-mode-colors
  `((t (:background ,material-blue-two :foreground ,material-grey-one)))
  "Normal mode colors!"
  :group 'sethen)

(defface replace-mode-colors
  `((t (:background ,material-red-one :foreground ,material-grey-one)))
  "Replace mode colors!"
  :group 'sethen)

(defface visual-mode-colors
  `((t (:background ,material-purple :foreground ,material-grey-one)))
  "Visual mode colors!"
  :group 'sethen)

(defun sethen-get-git-branch ()
  "Get git branch!"
  (if vc-mode
	  (propertize (concat "  " (substring vc-mode 5)) 'face 'git-name-colors)))

(defun sethen-get-buffer-name()
  "Get buffer name!"
  (cond
   ((sethen-is-buffer-name-dashboard) (propertize "  " 'face 'buffer-name-colors))
   ((sethen-is-buffer-name-help) (propertize "  " 'face 'buffer-name-colors))
   ((sethen-is-buffer-name-scratch) (propertize "  " 'face 'buffer-name-colors))
   (t (propertize " %b " 'face 'buffer-name-colors))))

(defun sethen-get-evil-state ()
  "Get evil state!"
  (defvar evil-state)

  (cond
   ((sethen-is-buffer-name-ignored))
   ((eq evil-state 'insert) (propertize " INSERT " 'face 'insert-mode-colors))
   ((eq evil-state 'normal) (propertize " NORMAL " 'face 'normal-mode-colors))
   ((eq evil-state 'replace) (propertize " REPLACE " 'face 'replace-mode-colors))
   ((eq evil-state 'visual) (propertize " VISUAL " 'face 'visual-mode-colors))))


(setq-default mode-line-format (list
								'(:eval (sethen-get-evil-state))
								'(:eval (sethen-get-buffer-name))
								'(:eval (sethen-get-git-branch))
								'(:eval (sethen-get-percentage-of-buffer))
								))

(provide 'sethen-modeline)

;;; sethen-modeline.el ends here
