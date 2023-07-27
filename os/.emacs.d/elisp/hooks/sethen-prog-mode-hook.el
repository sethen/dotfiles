(defun sethen/prog-mode-hook ()
  "Sethen Prog Mode Hook settings!"
  (if (eq major-mode 'dashboard-mode)
      (display-line-numbers-mode 0)
    (display-line-numbers-mode 1))

  (global-ligature-mode)
  (hl-block-mode)
  (rainbow-delimiters-mode)
  (rainbow-mode))

(add-hook 'prog-mode-hook 'sethen/prog-mode-hook)

(provide 'sethen-prog-mode-hook)
