(require 'use-package)

(use-package lsp-mode
  :custom
  (gc-cons-threshold 100000000)
  (lsp-eslint-auto-fix-on-save t)
  (lsp-idle-delay 0.500)
  (read-process-output-max (* 1024 1024))
  :commands (lsp-ensure-server)
  :config
  (setq lsp-completion-show-detail nil
	lsp-completion-show-kind nil)
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
  :custom (lsp-completion-provider :none)
  :defines (lsp-completion-show-detail lsp-completion-show-kind lsp-eslint-auto-fix-on-save))

(provide 'sethen-lsp-mode)
