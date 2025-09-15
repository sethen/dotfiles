-- theme plugin

return {
   'catppuccin/nvim',
   name = 'catppuccin',
   priority = 1000,
   config = function()
      require('catppuccin').setup({
         flavour = 'mocha',
         custom_highlights = function(colors)
            return {
               NormalFloat = { bg = colors.mantle, fg = colors.text },
               Pmenu = { bg = colors.mantle, fg = colors.text, },
               PmenuSel = { bg = colors.green, fg = colors.mantle }
            }
         end
      });

      local palette = require('catppuccin.palettes').get_palette('mocha')

      if palette == nil then
         return nil
      end

      vim.cmd.colorscheme 'catppuccin'
   end,
}
