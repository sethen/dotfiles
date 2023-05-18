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


(require 'use-package)
(require 'material-faces)

(defun sethen/treemacs-theme ()
  "Treemacs theme!"
  (treemacs-modify-theme "Default"
	:config
	(progn
	  (treemacs-create-icon
	   :icon (propertize " ") :extensions ("appimage" "dll" "sln"))
	  (treemacs-create-icon
	   :icon (propertize " " 'face 'material-yellow-fg) :extensions (".babelrc"))
	  (treemacs-create-icon
	   :icon " " :extensions ("cargo.toml" "cargo.lock"))
	  (treemacs-create-icon
	   :icon " " :extensions ("conf" "config" "envrc" "pro" "properties" "settings"))
	  (treemacs-create-icon
	   :icon " " :extensions ("cs"))
	  (treemacs-create-icon
	   :icon (propertize " " 'face 'material-purple-fg) :extensions ("css" "less" "sass" "scss"))
	  (treemacs-create-icon
	   :icon (propertize " " 'face 'material-purple-fg) :extensions ("icons-closed" "screenshots-closed"))
	  (treemacs-create-icon
	   :icon (propertize " " 'face 'material-purple-fg) :extensions ("icons-open" "screenshots-open"))
	  (treemacs-create-icon
	   :icon (propertize " " 'face 'white-fg) :extensions ("git-closed" "github-closed"))
	  (treemacs-create-icon
	   :icon (propertize " " 'face 'white-fg) :extensions ("git-open" "github-open"))
	  (treemacs-create-icon
	   :icon (propertize " " 'face 'material-blue-one-fg) :extensions ("src-closed"))
	  (treemacs-create-icon
	   :icon (propertize " " 'face 'material-blue-one-fg) :extensions ("src-open"))
	  (treemacs-create-icon
	   :icon (propertize " " 'face 'material-green-fg) :extensions ("build-closed" "public-closed"))
	  (treemacs-create-icon
	   :icon (propertize " " 'face 'material-green-fg) :extensions ("build-open" "public-open"))
	  (treemacs-create-icon
	   :icon (propertize " " 'face 'material-red-one-fg) :extensions ("bin-closed" "temp-closed" "tmp-closed" "private-closed"))
	  (treemacs-create-icon
	   :icon (propertize " " 'face 'material-red-one-fg) :extensions ("bin-open" "temp-open" "tmp-open" "private-open"))
	  (treemacs-create-icon
	   :icon (propertize " " 'face 'material-orange-fg) :extensions ("docs-open" "readme-open"))
	  (treemacs-create-icon
	   :icon (propertize " " 'face 'material-orange-fg) :extensions ("docs-closed" "readme-closed"))
	  (treemacs-create-icon
	   :icon (propertize " " 'face 'material-yellow-fg) :extensions ("test-closed"))
	  (treemacs-create-icon
	   :icon (propertize " " 'face 'material-yellow-fg) :extensions ("test-open"))
	  (treemacs-create-icon
	   :icon (propertize " " 'face 'material-blue-two-fg) :extensions (dir-closed root-closed))
	  (treemacs-create-icon
	   :icon (propertize " " 'face 'material-blue-two-fg) :extensions (dir-open root-open))
	  (treemacs-create-icon
	   :icon (propertize " " 'face 'material-blue-three-fg) :extensions ("diff"))
	  (treemacs-create-icon
	   :icon (propertize " " 'face 'material-blue-three-fg) :extensions ("dockerfile" "dockerignore" "docker-compose.yml"))
	  (treemacs-create-icon
	   :icon (propertize " " 'face 'material-purple-fg) :extensions (".eslint" ".eslintignore"))
	  (treemacs-create-icon
	   :icon " " :extensions ("otf" "ttf" "woff"))
	  (treemacs-create-icon
	   :icon " " :extensions ("editorconfig" "makefile"))
	  (treemacs-create-icon
	   :icon " " :extensions ("bmp" "gif" "png" "jpg" "svg"))
	  (treemacs-create-icon
	   :icon (propertize " " 'face 'material-purple-fg) :extensions ("el"))
	  (treemacs-create-icon
	   :icon " " :extensions ("bat" "fish" "sh" "zsh"))
	  (treemacs-create-icon
	   :icon (propertize " " 'face 'material-red-one-fg) :extensions ("git" "gitattributes" "gitignore" "gitignore_global" "gitconfig" "gitmodules"))
	  (treemacs-create-icon
	   :icon (propertize " " 'face 'material-purple-fg) :extensions ("gradle"))
	  (treemacs-create-icon
	   :icon (propertize " " 'face 'material-orange-fg) :extensions ("erb" "html"))
	  (treemacs-create-icon
	   :icon " " :extensions ("info" "log"))
	  (treemacs-create-icon
	   :icon " " :extensions ("license"))
	  (treemacs-create-icon
	   :icon (propertize " " 'face 'material-blue-one-fg) :extensions ("lua"))
	  (treemacs-create-icon
	   :icon (propertize " " 'face 'material-green-fg) :extensions ("nginx.conf"))
	  (treemacs-create-icon
	   :icon (propertize " " 'face 'material-red-two-fg) :extensions ("package.json" "package-lock.json"))
	  (treemacs-create-icon
	   :icon (propertize " " 'face 'material-blue-two-fg) :extensions ("py"))
	  (treemacs-create-icon
	   :icon (propertize " " 'face 'material-blue-three-fg) :extensions ("php"))
	  (treemacs-create-icon
	   :icon (propertize " " 'face 'material-yellow-fg) :extensions ("go"))
	  (treemacs-create-icon
	   :icon (propertize " " 'face 'material-purple-fg) :extensions ("jar" "java"))
	  (treemacs-create-icon
	   :icon (propertize " " 'face 'material-yellow-fg) :extensions ("js"))
	  (treemacs-create-icon
	   :icon (propertize " " 'face 'material-green-fg) :extensions ("json"))
	  (treemacs-create-icon
	   :icon (propertize " " 'face 'material-yellow-fg) :extensions ("jsx" "tsx"))
	  (treemacs-create-icon
	   :icon " " :extensions ("md"))
	  (treemacs-create-icon
	   :icon (propertize " " 'face 'material-green-fg) :extensions (".npmrc" "node" "node_modules"))
	  (treemacs-create-icon
	   :icon " " :extensions ("rs"))
	  (treemacs-create-icon
	   :icon (propertize " " 'face 'material-orange-fg) :extensions ("swift"))
	  (treemacs-create-icon
	   :icon (propertize " " 'face 'material-yellow-fg) :extensions ("sql"))
	  (treemacs-create-icon
	   :icon (propertize " " 'face 'material-red-one-fg) :extensions ("gemfile" "gemfile.lock" "rake" "rakefile" "rb"))
	  (treemacs-create-icon
	   :icon (propertize " " 'face 'material-blue-one-fg) :extensions ("toml"))
	  (treemacs-create-icon
	   :icon (propertize " " 'face 'material-blue-one-fg) :extensions ("ts" "tsbuildinfo"))
	  (treemacs-create-icon
	   :icon (propertize " " 'face 'material-yellow-fg) :extensions (".yarnrc" "yarn.lock" "yarn"))
	  (treemacs-create-icon
	   :icon (propertize " " 'face 'material-red-two-fg) :extensions ("yml" "yaml"))
	  (treemacs-create-icon
	   :icon (propertize " " 'face 'material-green-fg) :extensions ("vim"))
	  (treemacs-create-icon
	   :icon " " :extensions (".aliases" "ps1" ".zshenv" ".zshrc" "xml"))
	  (treemacs-create-icon
	   :icon " " :extensions ("zip"))
	  (treemacs-create-icon
	   :icon " " :extensions ("pdf"))
	  (treemacs-create-icon
	   :icon " " :extensions (fallback))
	  )))

(use-package treemacs
  :commands
  (dir-closed dir-open fallback treemacs-create-icon treemacs-indent-guide-mode treemacs-modify-theme)
  :config
  (setq treemacs-width 30
		treemacs-file-event-delay 0)
  (set-face-background 'treemacs-window-background-face material-grey-one)
  (set-face-background 'treemacs-hl-line-face material-grey-two)
  (treemacs-indent-guide-mode)
  (sethen/treemacs-theme))

(provide 'sethen-treemacs)

;;; sethen-treemacs.el ends here
