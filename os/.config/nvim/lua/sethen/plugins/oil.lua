return {
   'stevearc/oil.nvim',
   ---@module 'oil'
   ---@type oil.SetupOpts
   opts = {
      columns = {
         { "icon" , directory = "" },
      },
   },
   dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
}
