(defun core/prog-mode-hook ()
  "Core Prog Mode Hook settings!"
  (if (eq major-mode 'dashboard-mode)
      (display-line-numbers-mode 0)
    (display-line-numbers-mode 1))

  (global-ligature-mode)
  (hl-block-mode)
  (rainbow-delimiters-mode)
  (rainbow-mode))

(add-hook 'prog-mode-hook 'core/prog-mode-hook)

(provide 'core-prog-mode-hook)
