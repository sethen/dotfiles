return {
   "catppuccin/nvim",
   config = function()
      require("catppuccin").setup({
         flavour = "mocha",
      });
      local palette = require("catppuccin.palettes").get_palette("mocha")

      vim.cmd.colorscheme "catppuccin"
      vim.api.nvim_set_hl(0, "CursorLineNr", {fg=palette.lavender, bg=palette.mantle, bold = true})
   end,
   name = "catppuccin",
   priority = 1000
}
