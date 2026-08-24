vim.api.nvim_create_autocmd('CursorHold', {
   group = vim.api.nvim_create_augroup('sethen.lsp', { clear = false }),
   callback = function()
      vim.diagnostic.open_float(nil, {
         focusable = false,
         border = 'rounded',
         source = true,
         prefix = '',
         scope = 'cursor',
      })
   end,
})

vim.diagnostic.config({
   signs = {
      text = {
         [vim.diagnostic.severity.WARN] = '',
         [vim.diagnostic.severity.ERROR] = '',
         [vim.diagnostic.severity.HINT] = '',
         [vim.diagnostic.severity.INFO] = '',
      }
   }
})
