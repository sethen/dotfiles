;;; sethen-flycheck-posframe.el --- Flycheck Posframe settings -*- lexical-binding: t -*-

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

;; Flycheck Posframe for flycheck errors in a pretty box

;;; Code:

(require 'corfu)
(require 'use-package)

(use-package flycheck-posframe
  :after (corfu flycheck)
  :config
  (add-to-list 'flycheck-posframe-inhibit-functions #'(lambda () corfu--candidates))
  :defines (flycheck-posframe-inhbit-functions)
  :hook (flycheck-mode . flycheck-posframe-mode))

(provide 'sethen-flycheck-posframe)

;;; sethen-flycheck-posframe.el ends here
