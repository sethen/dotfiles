;;; sethen-treemacs-evil.el --- Treemacs Evil settings -*- lexical-binding: t -*-

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

;; Treemacs Evil package for Vim keybindings in Treemacs

;;; Code:

(require 'use-package)

(use-package treemacs-evil
  :requires (evil treemacs))

(provide 'sethen-treemacs-evil)

;;; sethen-treemacs-evil.el ends here
