(require 'use-package)

(use-package lsp-ui
  :config
  (setq lsp-completion-provider :none
	lsp-completion-show-detail t
	lsp-completion-show-kind t
	lsp-headerline-arrow ""
	lsp-keep-workspace-alive nil
	lsp-ui-doc-enable t
	lsp-ui-sideline-enable nil)
  :defines
  (lsp-completion-provider lsp-completion-show-detail lsp-completion-show-kind lsp-headerline-arrow))

(provide 'layer-lsp-ui)
