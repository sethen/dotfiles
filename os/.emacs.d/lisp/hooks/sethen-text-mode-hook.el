;;; sethen-text-mode-hook.el --- Text Mode hook settings -*- lexical-binding: t -*-

;; Author: sethen
;; Maintainer: sethen


;; This file is not part of GNU Emacs

;; This textram is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This textram is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this textram.  If not, see <https://www.gnu.org/licenses/>.


;;; Commentary:


;;; Code:

(defun sethen/text-mode-hook ()
  "Prod Mode hook settings!"
  (display-line-numbers-mode t))

(add-hook 'text-mode-hook 'sethen/text-mode-hook)

(provide 'sethen-text-mode-hook)

;;; sethen-text-mode-hook.el ends here
