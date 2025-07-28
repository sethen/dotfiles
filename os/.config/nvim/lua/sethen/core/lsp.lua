vim.lsp.enable({
   'bash-language-server',
   'csharp-language-server',
   'css-lsp',
   'dockerfile-language-server',
   'eslint-lsp',
   'gopls',
   'html-lsp', 'json-lsp',
   'lua-language-server',
   'solargraph',
   'sqlls',
   'tailwindcss-language-server',
   'typescript-language-server'
})

vim.api.nvim_create_autocmd('LspAttach', {
   group = vim.api.nvim_create_augroup('my.lsp', {}),
   callback = function(args)
      local bufnr = args.buf
      local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

      if client:supports_method('textDocument/completion') then
         local chars = {};
         for i = 32, 126 do table.insert(chars, string.char(i)) end

         client.server_capabilities.completionProvider.triggerCharacters = chars
         vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = true })
      end

      if client:supports_method("textDocument/signatureHelp") then
         local triggers = client.server_capabilities.signatureHelpProvider
             and client.server_capabilities.signatureHelpProvider.triggerCharacters
             or { "(", "," }

         vim.api.nvim_create_autocmd("TextChangedI", {
            group = vim.api.nvim_create_augroup("sethen.signature_help_" .. bufnr, { clear = true }),
            buffer = bufnr,
            callback = function()
               local col = vim.api.nvim_win_get_cursor(0)[2]
               local line = vim.api.nvim_get_current_line()
               local char_before = line:sub(col, col)
               if vim.tbl_contains(triggers, char_before) then
                  vim.lsp.buf.signature_help()
               end
            end,
         })
      end

      if not client:supports_method('textDocument/willSaveWaitUntil')
          and client:supports_method('textDocument/formatting') then
         vim.api.nvim_create_autocmd('BufWritePre', {
            group = vim.api.nvim_create_augroup('sethen.lsp', { clear = false }),
            buffer = bufnr,
            callback = function()
               vim.lsp.buf.format({ bufnr = bufnr, id = client.id, timeout_ms = 1000 })
            end,
         })
      end

      vim.keymap.set('i', '<C-l>', function()
         if vim.fn.pumvisible() == 1 then
            return vim.api.nvim_replace_termcodes("<C-y>", true, false, true)
         else
            return vim.api.nvim_replace_termcodes("<C-x><C-o>", true, false, true)
         end
      end, { expr = true, buffer = args.buf, silent = true })

      vim.keymap.set('i', '<C-j>', function()
         return vim.fn.pumvisible() == 1 and '<C-n>' or '<C-j>'
      end, { expr = true, buffer = args.buf })

      vim.keymap.set('i', '<C-k>', function()
         return vim.fn.pumvisible() == 1 and '<C-p>' or '<C-k>'
      end, { expr = true, buffer = args.buf })
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
