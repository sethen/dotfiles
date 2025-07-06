return {
   "olimorris/codecompanion.nvim",
   dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
   },
   config = function()
      require("codecompanion").setup({
         chat = {
            window = {
               position = "right",
               width = 0.4,
               height = 1,
            },
         },
      })
   end,
}
