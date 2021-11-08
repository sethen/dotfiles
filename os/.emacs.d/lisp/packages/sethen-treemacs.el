;;; sethen-treemacs.el --- Treemacs settings -*- lexical-binding: t -*-

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


(require 'material-colors)
(require 'use-package)

(defface blue-one-icon `((t (:foreground ,material-blue-one))) "")
(defface blue-two-icon `((t (:foreground ,material-blue-two))) "")
(defface blue-three-icon `((t (:foreground ,material-blue-three))) "")
(defface green `((t (:foreground ,material-green))) "")
(defface orange `((t (:foreground ,material-orange))) "")
(defface purple `((t (:foreground ,material-purple))) "")
(defface red-one-icon `((t (:foreground ,material-red-one))) "")
(defface red-two-icon `((t (:foreground ,material-red-two))) "")
(defface yellow `((t (:foreground ,material-yellow))) "")
(defface white `((t (:foreground ,material-white))) "")

(defun sethen/treemacs-theme ()
  "Treemacs theme!"
  (treemacs-modify-theme "Default"
	:config
	(progn
	  (treemacs-create-icon
	   :icon (propertize " " 'face 'alert-urgent-face) :extensions ("appimage" "dll" "sln"))
	  (treemacs-create-icon
	   :icon " " :extensions ("conf"))
	  (treemacs-create-icon
	   :icon " " :extensions ("cs"))
	  (treemacs-create-icon
	   :icon (propertize " " 'face 'purple) :extensions ("css" "less" "sass" "scss"))
	  (treemacs-create-icon
	   :icon (propertize " " 'face 'blue-two-icon) :extensions (dir-closed root-closed))
	  (treemacs-create-icon
	   :icon (propertize " " 'face 'blue-two-icon) :extensions (dir-open root-open))
	  (treemacs-create-icon
	   :icon (propertize " " 'face 'blue-three-icon) :extensions ("diff"))
	  (treemacs-create-icon
	   :icon (propertize " " 'face 'blue-three-icon) :extensions ("dockerfile" "dockerignore"))
	  (treemacs-create-icon
	   :icon " " :extensions ("otf" "ttf" "woff"))
	  (treemacs-create-icon
	   :icon " " :extensions ("editorconfig"))
	  (treemacs-create-icon
	   :icon " " :extensions ("bmp" "png" "jpg" "svg"))
	  (treemacs-create-icon
	   :icon (propertize " " 'face 'purple) :extensions ("el"))
	  (treemacs-create-icon
	   :icon " " :extensions ("fish" "sh" "zsh"))
	  (treemacs-create-icon
	   :icon (propertize "" 'face 'red-one-icon) :extensions ("git" "gitignore" "gitignore_global" "gitconfig"))
	  (treemacs-create-icon
	   :icon (propertize " " 'face 'orange) :extensions ("html"))
	  (treemacs-create-icon
	   :icon " " :extensions ("info" "log"))
	  (treemacs-create-icon
	   :icon " " :extensions ("license"))
	  (treemacs-create-icon
	   :icon (propertize " " 'face 'blue-one-icon) :extensions ("lua"))
	  (treemacs-create-icon
	   :icon (propertize " " 'face 'green) :extensions ("nginx.conf"))
	  (treemacs-create-icon
	   :icon (propertize " " 'face 'red-two-icon) :extensions ("package.json" "package-lock.json"))
	  (treemacs-create-icon
	   :icon (propertize " " 'face 'blue-two-icon) :extensions ("py"))
	  (treemacs-create-icon
	   :icon (propertize " " 'face 'blue-three-icon) :extensions ("php"))
	  (treemacs-create-icon
	   :icon (propertize " " 'face 'yellow) :extensions ("go"))
	  (treemacs-create-icon
	   :icon (propertize " " 'face 'yellow) :extensions ("js"))
	  (treemacs-create-icon
	   :icon (propertize " " 'face 'green) :extensions ("json"))
	  (treemacs-create-icon
	   :icon (propertize " " 'face 'yellow) :extensions ("jsx" "tsx"))
	  (treemacs-create-icon
	   :icon " " :extensions ("md"))
	  (treemacs-create-icon
	   :icon (propertize " " 'face 'green) :extensions ("node" "node_modules"))
	  (treemacs-create-icon
	   :icon " " :extensions ("rs"))
	  (treemacs-create-icon
	   :icon (propertize " " 'face 'red-one-icon) :extensions ("rb"))
	  (treemacs-create-icon
	   :icon (propertize " " 'face 'blue-one-icon) :extensions ("toml"))
	  (treemacs-create-icon
	   :icon (propertize " " 'face 'blue-one-icon) :extensions ("ts" "tsbuildinfo"))
	  (treemacs-create-icon
	   :icon (propertize " " 'face 'yellow) :extensions ("yarn"))
	  (treemacs-create-icon
	   :icon (propertize " " 'face 'red-two-icon) :extensions ("yml" "yaml"))
	  (treemacs-create-icon
	   :icon (propertize " " 'face 'green) :extensions ("vim"))
	  (treemacs-create-icon
	   :icon " " :extensions (".aliases" "ps1" ".zshenv" ".zshrc" "xml"))
	  (treemacs-create-icon
	   :icon " " :extensions ("zip"))
	  (treemacs-create-icon
	   :icon " " :extensions (fallback))
	  )))

(use-package treemacs
  :commands
  (dir-closed dir-open fallback treemacs-create-icon treemacs-indent-guide-mode treemacs-modify-theme)
  :config
  (setq treemacs-width 30
		treemacs-file-event-delay 0)
  (setf treemacs-window-background-color (cons "#1c262b" "#263238"))
  (treemacs-indent-guide-mode)
  (sethen/treemacs-theme))

(provide 'sethen-treemacs)

;;; sethen-treemacs.el ends here
