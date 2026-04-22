-- auto completion for lsp

local keymaps = require('sethen.core.constants').keymaps

return {
   'saghen/blink.cmp',
   version = '1.*',
   dependencies = {
      'rafamadriz/friendly-snippets',
   },
   opts = function()
      return {
         appearance = {
            kind_icons = {
               Class = " ",
               Color = " ",
               Constant = " ",
               Constructor = " ",
               Enum = " ",
               EnumMember = " ",
               Event = " ",
               Field = " ",
               File = " ",
               Folder = " ",
               Function = " ",
               Interface = " ",
               Keyword = " ",
               Method = " ",
               Module = " ",
               Operator = " ",
               Property = " ",
               Reference = " ",
               Snippet = " ",
               Struct = " ",
               Text = " ",
               TypeParameter = " ",
               Unit = " ",
               Value = " ",
               Variable = " ",
            },
         },
         completion = {
            documentation = {
               auto_show = true,
            },
            menu = {
               draw = {
                  columns = {
                     { 'kind' },
                     { 'kind_icon', gap = 1 },
                     { 'label' },
                     { 'source_name', gap = 1 },
                  },
               },
            },
         },
         fuzzy = {
            implementation = 'prefer_rust_with_warning',
         },
         keymap = {
            [keymaps.accept] = { 'accept', 'fallback' },
         },
         signature = {
            enabled = true,
         },
         sources = {
            default = { 'buffer', 'lsp', 'path', 'snippets' },
         },
      }
   end,
   opts_extend = { 'sources.default' },
}
