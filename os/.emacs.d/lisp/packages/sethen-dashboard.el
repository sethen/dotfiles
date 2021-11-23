;;; sethen-dashboard.el --- Dashboard settings -*- lexical-binding: t -*-

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

(use-package dashboard
  :bind (:map dashboard-mode-map
		 ("M-j" . widget-forward)
		 ("M-k" . widget-backward)
		 ("M-l" . evil-ret))
  :commands
  (dashboard-setup-startup-hook widget-backward widget-forward)
  :config
  (setq dashboard-banner-logo-title "i’ll leave tomorrow’s problems to tomorrow’s me"
		dashboard-center-content t
		dashboard-set-footer nil
		dashboard-set-init-info t
		dashboard-set-navigator t
		dashboard-startup-banner "~/.emacs.d/images/opm.gif"
		dashboard-navigator-buttons
		`(;; line1
		  (("\ue965" "GitHub" "Sethen's GitHub" (lambda (&rest _) (browse-url "https://www.github.com/sethen")))
		   ("\ue9b0" "Melpa" "Melpa Package Repository" (lambda (&rest _) (browse-url "https://melpa.org/#/"))))))
  :init
  (dashboard-setup-startup-hook))

(provide 'sethen-dashboard)

;;; sethen-dashboard.el ends here
