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
                  components = {
                     kind_icon = {
                        text = function(ctx)
                           local icon = ctx.kind_icon

                           if ctx.source_name == 'Path' then
                              local dev_icon =
                                  require('nvim-web-devicons').get_icon(ctx.label)
                              if dev_icon then
                                 icon = dev_icon
                              end
                           end

                           return icon .. ctx.icon_gap
                        end,

                        highlight = function(ctx)
                           local hl = ctx.kind_hl

                           if ctx.source_name == 'Path' then
                              local _, dev_hl =
                                  require('nvim-web-devicons').get_icon(ctx.label)
                              if dev_hl then
                                 hl = dev_hl
                              end
                           end

                           return hl
                        end,
                     },
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
