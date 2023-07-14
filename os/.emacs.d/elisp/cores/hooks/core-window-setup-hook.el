(defun core/window-setup-hook ()
  "Window Setup Hook settings!"
  (toggle-frame-maximized t))

(add-hook 'window-setup-hook 'core/prog-mode-hook)

(provide 'core-window-setup-hook)
