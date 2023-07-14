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
	dashboard-startup-banner "~/.emacs.d/images/ok.png"
	dashboard-navigator-buttons
	`(
	  (("\ue965" "GitHub" "Sethen's GitHub" (lambda (&rest _) (browse-url "https://www.github.com/sethen")))
	   ("\ue9b0" "Melpa" "Melpa Package Repository" (lambda (&rest _) (browse-url "https://melpa.org/#/"))))))
  :init (dashboard-setup-startup-hook))

(provide 'layer-dashboard)
