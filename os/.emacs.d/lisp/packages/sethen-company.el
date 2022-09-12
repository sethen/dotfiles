;;; sethen-company.el --- sethen-company settings -*- lexical-binding: t -*-

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

(use-package company
  :bind (:map company-active-map
			  ("M-j" . 'company-select-next)
			  ("M-k" . 'company-select-previous)
			  ("M-l" . 'company-complete-selection)
			  ("M-n" . 'company-other-backend))
  :commands
  (company-complete-selection company-other-backend company-select-next company-select-previous global-company-mode)
  :config
  (setq company-idle-delay 0
		company-minimum-prefix-length 1)
  :init
  (global-company-mode))

(provide 'sethen-company)

;;; sethen-company.el ends here
