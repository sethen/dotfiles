return {
   'rcarriga/nvim-notify',
   config = function()
      require('notify').setup({
         icons = {
            DEBUG = " ",
            ERROR = " ",
            INFO = " ",
            TRACE = " ",
            WARN = " "
         },
         on_open = function(win)
            vim.api.nvim_win_set_config(win, { focusable = false })
         end,
      })
   end,
}
