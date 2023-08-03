(require 'use-package)

(use-package orderless
  :custom
  (orderless-component-separator "[ &]")
  (completion-styles '(orderless partial-completion basic)
		     (completion-category-defaults nil)
		     (completion-category-overrides nil)))

(provide 'sethen-orderless)
