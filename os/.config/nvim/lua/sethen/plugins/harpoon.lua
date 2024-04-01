return {
   'ThePrimeagen/harpoon',
   dependencies = {
      'nvim-lua/plenary.nvim'
   },
   keys = {
      { '<Space>hm', "<Cmd>lua require('harpoon.mark').add_file()<CR>", desc = 'Harpoon add file' },
      { '<Space>hq', "<Cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", desc = 'Harpoon toggle quick menu' },
   },
}
