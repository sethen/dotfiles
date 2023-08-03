(global-whitespace-mode)

(setq whitespace-style (delete 'lines whitespace-style)
      whitespace-style (delete 'line-tails whitespace-style)
      whitespace-display-mappings '((space-mark ?\  [?\u00B7])
				    (newline-mark ?\n [?¬ ?\n])
				    (tab-mark ?\t [?\u00BB ?\t])))

(provide 'sethen-whitespace)
