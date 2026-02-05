vim.api.nvim_create_autocmd('LspAttach', {
   group = vim.api.nvim_create_augroup('sethen.lsp', {}),
   callback = function(args)
      local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
      if not client then return end

      if not client:supports_method('textDocument/willSaveWaitUntil')
          and client:supports_method('textDocument/formatting') then
         vim.api.nvim_create_autocmd('BufWritePre', {
            group = vim.api.nvim_create_augroup('sethen.lsp', { clear = false }),
            buffer = args.buf,
            callback = function()
               vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
            end,
         })
      end
   end,
})

vim.api.nvim_create_autocmd('CursorHold', {
   group = vim.api.nvim_create_augroup('sethen.lsp', { clear = false }),
   callback = function()
      vim.diagnostic.open_float(nil, {
         focusable = false,
         border = 'rounded',
         source = 'always',
         prefix = '',
         scope = 'cursor',
      })
   end,
})

vim.diagnostic.config({
   signs = {
      text = {
         [vim.diagnostic.severity.WARN] = ' ',
         [vim.diagnostic.severity.ERROR] = ' ',
         [vim.diagnostic.severity.HINT] = ' ',
         [vim.diagnostic.severity.INFO] = ' ',
      }
   }
})

vim.lsp.enable({
   'bash-language-server',
   'csharp-language-server',
   'css-lsp',
   'dockerfile-language-server',
   'eslint-lsp',
   'fish-lsp',
   'gopls',
   'html-lsp', 'json-lsp',
   'lua-language-server',
   'solargraph',
   'sqlls',
   'tailwindcss-language-server',
   'ts-ls',
   'typescript-language-server'
})
