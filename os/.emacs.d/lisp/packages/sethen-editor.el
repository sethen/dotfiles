;;; sethen-editor.el --- Editor settings -*- lexical-binding: t -*-

;; Author: sethen
;; Maintainer: sethen
;; Version: version
;; Package-Requires: (dependencies)
;; Homepage: homepage
;; Keywords: keywords


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

(defvar display-line-numbers-type)
(defvar whitespace-display-mappings)

(defun sethen/enable-line-numbers-mode ()
  "Enable line numbers mode!"
  (display-line-numbers-mode t))

(setq display-line-numbers-type 'relative)

(add-hook 'prog-mode-hook 'sethen/enable-line-numbers-mode)
(add-hook 'text-mode-hook 'sethen/enable-line-numbers-mode)

(setq-default tab-width 4)

(setq whitespace-display-mappings '((space-mark ?\  [?\u00B7])
									(newline-mark ?\n [?¬ ?\n])
									(tab-mark ?\t [?\u00BB ?\t])))

(provide 'sethen-editor)

;;; sethen-editor.el ends here
