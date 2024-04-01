return {
   "coffebar/neovim-project",
   opts = {
      dashboard_mode = true,
      projects = {
         "~/Developer/*",
      },
   },
   init = function()
      vim.opt.sessionoptions:append("globals")
   end,
   dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope.nvim" },
      { "Shatur/neovim-session-manager" },
   },
   lazy = false,
   priority = 100,
}
