;;; sethen-doom-modeline.el --- Doom Modeline settings -*- lexical-binding: t -*-

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

;; Doom Modeline package for doom modeline

;;; Code:

(require 'use-package)

(use-package doom-modeline
  :commands (doom-modeline-mode)
  :config (setq doom-modeline-icon nil)
  :init (doom-modeline-mode))

(provide 'sethen-doom-modeline)

;;; sethen-doom-modeline.el ends here