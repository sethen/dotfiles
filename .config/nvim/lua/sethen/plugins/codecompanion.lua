-- ai completion that works with github copilot and others

return {
   "olimorris/codecompanion.nvim",
   dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
   },
   config = function()
      require("codecompanion").setup({
         strategies = {
            chat = {
               name = 'copilot',
               model = 'gpt-4.1',
               window = {
                  position = "right",
                  width = 0.4,
                  height = 1,
               },
            },
         },
         prompt = "Prompt",
         provider = "telescope",
         opts = {
            show_default_actions = true,
            show_default_prompt_library = true,
            title = "CodeCompanion actions",
         },
      })
   end
}
