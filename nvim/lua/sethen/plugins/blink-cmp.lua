-- auto completion for lsp

local keymaps = require('sethen.core.keymaps')

return {
   'saghen/blink.cmp',
   version = '1.*',

   dependencies = {
      'rafamadriz/friendly-snippets',
      'onsails/lspkind.nvim',
      'nvim-tree/nvim-web-devicons',
   },
   opts = function()
      local lspkind = require('lspkind')

      return {
         appearance = {
            kind_icons = lspkind.symbol_map,
         },
         completion = {
            documentation = {
               auto_show = true,
            },
            menu = {
               draw = {
                  columns = {
                     { 'label' },
                     { 'source_name', gap = 1 },
                     { 'kind_icon',   gap = 1 },
                     { 'kind' },
                  },
               },
            },
         },
         signature = {
            enabled = true,
         },
         keymap = {
            [keymaps.accept] = { 'accept', 'fallback' },
         },
         sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
         },
         fuzzy = {
            implementation = 'prefer_rust_with_warning',
         },
      }
   end,
   opts_extend = { 'sources.default' },
}
