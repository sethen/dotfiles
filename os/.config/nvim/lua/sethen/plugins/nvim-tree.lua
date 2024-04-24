return {
   'nvim-tree/nvim-tree.lua',
   dependencies = {
      'nvim-tree/nvim-web-devicons'
   },
   config = function()
      local nvimtree = require('nvim-tree')

      local function on_attach_change(bufnr)
         local nvimtree_api = require('nvim-tree.api')
         local function opts(desc)
            return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
         end

         nvimtree_api.config.mappings.default_on_attach(bufnr)

         vim.keymap.set('n', 'h', nvimtree_api.node.open.edit, opts('Close'))
         vim.keymap.set('n', 'l', nvimtree_api.node.open.edit, opts('Open'))
      end

      nvimtree.setup({
         on_attach = on_attach_change,
         renderer = {
            highlight_git = true,
            icons = {
               symlink_arrow = '  ',
               glyphs = {
                  default = '',
                  symlink = '',
                  folder = {
                     default = '',
                     empty = '',
                     empty_open = '',
                     open = '',
                     symlink = '',
                     symlink_open = '',
                  },
               },
               show = {
                  folder_arrow = false,
                  git = false
               },
            },
         },
      })
   end
}
