(defun sethen/window-setup-hook ()
  "Window Setup Hook settings!"
  (toggle-frame-maximized t))

(add-hook 'window-setup-hook 'sethen/prog-mode-hook)

(provide 'sethen-window-setup-hook)
