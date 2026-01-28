-- indent guidelines for buffers

return {
   "lukas-reineke/indent-blankline.nvim",
   config = function()
      local palette = require('catppuccin.palettes').get_palette('mocha')

      if (palette == nil) then
         return nil
      end

      local highlight = {
         "RainbowRed",
         "RainbowYellow",
         "RainbowBlue",
         "RainbowOrange",
         "RainbowGreen",
         "RainbowViolet",
         "RainbowCyan",
      }
      local hooks = require "ibl.hooks"

      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
         vim.api.nvim_set_hl(0, "RainbowRed", { fg = palette.red })
         vim.api.nvim_set_hl(0, "RainbowYellow", { fg = palette.yellow })
         vim.api.nvim_set_hl(0, "RainbowBlue", { fg = palette.blue })
         vim.api.nvim_set_hl(0, "RainbowOrange", { fg = palette.peach })
         vim.api.nvim_set_hl(0, "RainbowGreen", { fg = palette.green })
         vim.api.nvim_set_hl(0, "RainbowViolet", { fg = palette.mauve })
         vim.api.nvim_set_hl(0, "RainbowCyan", { fg = palette.teal })
      end)

      vim.g.rainbow_delimiters = { highlight = highlight }

      require("ibl").setup { scope = { highlight = highlight } }

      hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
   end,
   main = "ibl",
}
