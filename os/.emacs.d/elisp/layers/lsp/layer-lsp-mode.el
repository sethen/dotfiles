(require 'use-package)

(use-package lsp-mode
  :config
  (setq gc-cons-threshold 100000000
	lsp-eslint-auto-fix-on-save t
	lsp-idle-delay 0.500
	read-process-output-max (* 1024 1024))
  (lsp-ensure-server 'css-ls)
  (lsp-ensure-server 'dockerfile-ls)
  (lsp-ensure-server 'eslint)
  (lsp-ensure-server 'html-ls)
  (lsp-ensure-server 'json-ls)
  (lsp-ensure-server 'lua-language-server)
  (lsp-ensure-server 'omnisharp)
  (lsp-ensure-server 'rust-analyzer)
  (lsp-ensure-server 'ts-ls)
  (lsp-ensure-server 'yamlls)
  :commands (lsp-ensure-server)
  :custom (lsp-completion-provider :none)
  :defines (lsp-eslint-auto-fix-on-save))


(provide 'layer-lsp-mode)
