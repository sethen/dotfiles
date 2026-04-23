return {
   'mfussenegger/nvim-dap',
   dependencies = {
      'williamboman/mason.nvim',
      "jay-babu/mason-nvim-dap.nvim",
   },
   config = function()
      require('mason').setup()
      require("mason-nvim-dap").setup({
         automatic_installation = true,
         ensure_installed = {
            "delve"
         }
      })
   end,
}
