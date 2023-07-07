;;; sethen-gui.el --- GUI settings -*- lexical-binding: t -*-

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

;; GUI preferences

;;; Code:

(menu-bar-mode 0)
(scroll-bar-mode 0)
(tab-bar-mode 0)
(tool-bar-mode 0)

(setq column-number-mode 1
      inhibit-startup-screen 0
      use-dialog-box 0
      visible-bell 1)

(provide 'sethen-gui)

;;; sethen-gui.el ends here
