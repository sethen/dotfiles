;;; sethen-exec-path-from-shell.el --- Exec Path From Shell settings -*- lexical-binding: t -*-

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

;; Exec Path From Shell package to read environment variables

;;; Code:

(require 'use-package)

(use-package exec-path-from-shell
  :commands (exec-path-from-shell-initialize)
  :init (exec-path-from-shell-initialize))

(provide 'sethen-exec-path-from-shell)

;;; sethen-exec-path-from-shell.el ends here
