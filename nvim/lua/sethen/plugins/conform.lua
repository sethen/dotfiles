-- indents code on save

return {
   'stevearc/conform.nvim',
   opts = {
      format_on_save = {
         timeout_ms = 500,
         lsp_format = "fallback"
      },
   },
}
