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

;; Treemacs package for directory tree navigation

;;; Code:

(require 'use-package)

(use-package treemacs
  :config
  (setq treemacs-width 30
	treemacs-file-event-delay 0)
  (set-face-background 'treemacs-window-background-face "#1c262b")
  (set-face-background 'treemacs-hl-line-face "#263238")
  (treemacs-modify-theme "Default"
    :config
    (progn
      (treemacs-create-icon
       :icon (propertize " ")
       :extensions ("appimage" "dll" "sln"))
      (treemacs-create-icon
       :icon (propertize " " 'face '((:foreground "#ffcb6b")))
       :extensions (".babelrc"))
      (treemacs-create-icon
       :icon " "
       :extensions ("cargo.toml" "cargo.lock"))
      (treemacs-create-icon
       :icon " "
       :extensions ("conf" "config" "envrc" "pro" "properties" "settings"))
      (treemacs-create-icon
       :icon " "
       :extensions ("cs"))
      (treemacs-create-icon
       :icon (propertize " " 'face '((:foreground "#c792ea")))
       :extensions ("css" "less" "sass" "scss"))
      (treemacs-create-icon
       :icon (propertize " " 'face '((:foreground "#c792ea")))
       :extensions ("icons-closed" "screenshots-closed"))
      (treemacs-create-icon
       :icon (propertize " " 'face '((:foreground "#c792ea")))
       :extensions ("icons-open" "screenshots-open"))
      (treemacs-create-icon
       :icon (propertize " " 'face '((:foreground "#ffffff")))
       :extensions ("git-closed" "github-closed"))
      (treemacs-create-icon
       :icon (propertize " " 'face '((:foreground "#ffffff")))
       :extensions ("git-open" "github-open"))
      (treemacs-create-icon
       :icon (propertize " " 'face '((:foreground "#80cbc4")))
       :extensions ("src-closed"))
      (treemacs-create-icon
       :icon (propertize " " 'face '((:foreground "#80cbc4")))
       :extensions ("src-open"))
      (treemacs-create-icon
       :icon (propertize " " 'face '((:foreground "#c3e88d")))
       :extensions ("build-closed" "public-closed"))
      (treemacs-create-icon
       :icon (propertize " " 'face '((:foreground "#c3e88d")))
       :extensions ("build-open" "public-open"))
      (treemacs-create-icon
       :icon (propertize " " 'face '((:foreground "#f07178")))
       :extensions ("bin-closed" "temp-closed" "tmp-closed" "private-closed"))
      (treemacs-create-icon
       :icon (propertize " " 'face '((:foreground "#f07178")))
       :extensions ("bin-open" "temp-open" "tmp-open" "private-open"))
      (treemacs-create-icon
       :icon (propertize " " 'face '((:foreground "#f78c6c")))
       :extensions ("docs-open" "readme-open"))
      (treemacs-create-icon
       :icon (propertize " " 'face '((:foreground "#f78c6c")))
       :extensions ("docs-closed" "readme-closed"))
      (treemacs-create-icon
       :icon (propertize " " 'face '((:foreground "#ffcb6c")))
       :extensions ("test-closed"))
      (treemacs-create-icon
       :icon (propertize " " 'face '((:foreground "#ffcb6c")))
       :extensions ("test-open"))
      (treemacs-create-icon
       :icon (propertize " " 'face '((:foreground "#82aaff")))
       :extensions (dir-closed root-closed))
      (treemacs-create-icon
       :icon (propertize " " 'face '((:foreground "#82aaff")))
       :extensions (dir-open root-open))
      (treemacs-create-icon
       :icon (propertize " " 'face '((:foreground "#89ddff")))
       :extensions ("diff"))
      (treemacs-create-icon
       :icon (propertize " " 'face '((:foreground "#89ddff")))
       :extensions ("dockerfile" "dockerignore" "docker-compose.yml"))
      (treemacs-create-icon
       :icon (propertize " " 'face '((:foreground "#c792ea")))
       :extensions (".eslint" ".eslintignore"))
      (treemacs-create-icon
       :icon " "
       :extensions ("otf" "ttf" "woff"))
      (treemacs-create-icon
       :icon " "
       :extensions ("editorconfig" "makefile"))
      (treemacs-create-icon
       :icon " "
       :extensions ("bmp" "gif" "png" "jpg" "svg"))
      (treemacs-create-icon
       :icon (propertize " " 'face '((:foreground "#c792ea")))
       :extensions ("el"))
      (treemacs-create-icon
       :icon " "
       :extensions ("bat" "fish" "sh" "zsh"))
      (treemacs-create-icon
       :icon (propertize " " 'face '((:foreground "#f07178")))
       :extensions ("git" "gitattributes" "gitignore" "gitignore_global" "gitconfig" "gitmodules"))
      (treemacs-create-icon
       :icon (propertize " " 'face '((:foreground "#c792ea")))
       :extensions ("gradle"))
      (treemacs-create-icon
       :icon (propertize " " 'face '((:foreground "#f78c6c")))
       :extensions ("erb" "html"))
      (treemacs-create-icon
       :icon " "
       :extensions ("info" "log"))
      (treemacs-create-icon
       :icon " "
       :extensions ("license"))
      (treemacs-create-icon
       :icon (propertize " " 'face '((:foreground "#80cbc4")))
       :extensions ("lua"))
      (treemacs-create-icon
       :icon (propertize " " 'face '((:foreground "#c3e88d")))
       :extensions ("nginx.conf"))
      (treemacs-create-icon
       :icon (propertize " " 'face '((:foreground "#ff5370")))
       :extensions ("package.json" "package-lock.json"))
      (treemacs-create-icon
       :icon (propertize " " 'face '((:foreground "#82aaff")))
       :extensions ("py"))
      (treemacs-create-icon
       :icon (propertize " " 'face '((:foreground "#89ddff")))
       :extensions ("php"))
      (treemacs-create-icon
       :icon (propertize " " 'face '((:foreground "#ffcb6b")))
       :extensions ("go"))
      (treemacs-create-icon
       :icon (propertize " " 'face '((:foreground "#c792ea")))
       :extensions ("jar" "java"))
      (treemacs-create-icon
       :icon (propertize " " 'face '((:foreground "#ffcb6b")))
       :extensions ("js"))
      (treemacs-create-icon
       :icon (propertize " " 'face '((:foreground "#c3e88d")))
       :extensions ("json"))
      (treemacs-create-icon
       :icon (propertize " " 'face '((:foreground "#ffcb6b")))
       :extensions ("jsx" "tsx"))
      (treemacs-create-icon
       :icon " "
       :extensions ("md"))
      (treemacs-create-icon
       :icon (propertize " " 'face '((:foreground "#c3e88d")))
       :extensions (".npmrc" "node" "node_modules"))
      (treemacs-create-icon
       :icon " "
       :extensions ("rs"))
      (treemacs-create-icon
       :icon (propertize " " 'face '((:foreground "#f78c6c")))
       :extensions ("swift"))
      (treemacs-create-icon
       :icon (propertize " " 'face '((:foreground "#ffcb6b")))
       :extensions ("sql"))
      (treemacs-create-icon
       :icon (propertize " " 'face '((:foreground "#f07178")))
       :extensions ("gemfile" "gemfile.lock" "rake" "rakefile" "rb"))
      (treemacs-create-icon
       :icon (propertize " " 'face '((:foreground "#80cbc4")))
       :extensions ("toml"))
      (treemacs-create-icon
       :icon (propertize " " 'face '((:foreground "#80cbc4")))
       :extensions ("ts" "tsbuildinfo"))
      (treemacs-create-icon
       :icon (propertize " " 'face '((:foreground "#ffcb6b")))
       :extensions (".yarnrc" "yarn.lock" "yarn"))
      (treemacs-create-icon
       :icon (propertize " " 'face '((:foreground "#ff5370")))
       :extensions ("yml" "yaml"))
      (treemacs-create-icon
       :icon (propertize " " 'face '((:foreground "#c3e88d")))
       :extensions ("vim"))
      (treemacs-create-icon
       :icon " "
       :extensions (".aliases" "ps1" ".zshenv" ".zshrc" "xml"))
      (treemacs-create-icon
       :icon " "
       :extensions ("zip"))
      (treemacs-create-icon
       :icon " "
       :extensions ("pdf"))
      (treemacs-create-icon
       :icon " "
       :extensions (fallback)))))

  (provide 'sethen-treemacs)

;;; sethen-treemacs.el ends here
