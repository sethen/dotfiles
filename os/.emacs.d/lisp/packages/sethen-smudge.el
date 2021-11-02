;;; sethen-smudge.el --- Smudge settings -*- lexical-binding: t -*-

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

(use-package smudge
  :defines
  (smudge-oauth2-client-id smudge-oauth2-client-secret)
  :config
  (setq smudge-oauth2-client-id "c9e3d73df8c54cf3800b407eb890cf51"
		smudge-oauth2-client-secret "b85462351a62458bab1b84bf380e3ecd"
		smudge-transport 'connect))

(provide 'sethen-smudge)

;;; sethen-smudge.el ends here
