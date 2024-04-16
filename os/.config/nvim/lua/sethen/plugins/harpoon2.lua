return {
   'ThePrimeagen/harpoon',
   branch = "harpoon2",
   dependencies = {
      'nvim-lua/plenary.nvim'
   },
   config = function ()
      local harpoon = require('harpoon')

      harpoon.setup()

      vim.keymap.set("n", "<Space>hm", function() harpoon:list():add() end, { desc = "Harpoon add mark"})
   end
}
