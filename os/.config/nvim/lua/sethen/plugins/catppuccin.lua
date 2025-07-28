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
               Pmenu = { fg = colors.text, bg = colors.mantle },
               PmenuSel = { fg = colors.mantle, bg = colors.green }
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
