return {
   'folke/which-key.nvim',
   event = 'VeryLazy',
   init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 500
   end,
   opts = {
      icons = {
        keys = {
          Up = " ",
          Down = " ",
          Left = " ",
          Right = " ",
          C = "C ",
          M = "M ",
          D = "D ",
          S = "S ",
          CR = "CR ",
          Esc = "ESC ",
          ScrollWheelDown = " ",
          ScrollWheelUp = " ",
          NL = " ",
          BS = " ",
          Space = " ",
          Tab = " ",
          F1 = "F1",
          F2 = "F2",
          F3 = "F3",
          F4 = "F4",
          F5 = "F5",
          F6 = "F6",
          F7 = "F7",
          F8 = "F8",
          F9 = "F9",
          F10 = "F10",
          F11 = "F11",
          F12 = "F12",
        },
         mappings = false,
      },
   },
}
