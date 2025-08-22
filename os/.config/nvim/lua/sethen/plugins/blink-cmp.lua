-- auto completion for lsp

return {
   'saghen/blink.cmp',
   dependencies = { 'rafamadriz/friendly-snippets' },
   version = '1.*',
   opts = {
      completion = { documentation = { auto_show = true } },
      signature = { enabled = true },
      keymap = { preset = 'default' },
      sources = {
         default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
      fuzzy = { implementation = "prefer_rust_with_warning" }
   },
   opts_extend = { "sources.default" }
}
