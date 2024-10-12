return {
   'catppuccin/nvim',
   name = 'catppuccin',
   priority = 1000,
   config = function()
      require('catppuccin').setup({
         flavour = 'mocha',
      });
      local palette = require('catppuccin.palettes').get_palette('mocha')

      if (palette == nil) then
         return nil
      end

      vim.cmd.colorscheme 'catppuccin'
   end,
}
