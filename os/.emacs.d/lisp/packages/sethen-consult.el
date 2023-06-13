;;; sethen-consult.el --- Consult settings -*- lexical-binding: t -*-

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

(use-package consult
  :config
  (setq consult-ripgrep-args "rg --hidden --null --line-buffered --color=never --max-columns=1000 --path-separator /\
   --smart-case --no-heading --line-number ."
		consult-project-root-function
		(lambda ()
		  (when-let (project (project-current))
			(car (project-roots project)))))
  :commands (project-roots))

(provide 'sethen-consult)

;;; sethen-consult.el ends here
