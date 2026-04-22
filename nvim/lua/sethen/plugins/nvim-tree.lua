-- directory tree

return {
   'nvim-tree/nvim-tree.lua',
   config = function()
      local nvimtree = require('nvim-tree')
      local keymaps = require('sethen.core.constants').keymaps

      local function on_attach_change(bufnr)
         local nvimtree_api = require('nvim-tree.api')
         local function opts(desc)
            return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
         end

         nvimtree_api.config.mappings.default_on_attach(bufnr)

         vim.keymap.set('n', keymaps.right, nvimtree_api.node.open.edit, opts('Close'))
         vim.keymap.set('n', keymaps.left, nvimtree_api.node.open.edit, opts('Open'))
      end

      nvimtree.setup({
         filters = {
            git_ignored = false,
         },
         on_attach = on_attach_change,
         renderer = {
            highlight_git = true,
            indent_markers = {
               enable = true
            },
            icons = {
               symlink_arrow = '  ',
               glyphs = {
                  default = ' ',
                  symlink = ' ',
                  folder = {
                     default = ' ',
                     empty = ' ',
                     empty_open = ' ',
                     open = ' ',
                     symlink = ' ',
                     symlink_open = ' ',
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
