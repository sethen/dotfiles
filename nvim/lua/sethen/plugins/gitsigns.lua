-- git signs for showing modified buffers in number line

return {
   'lewis6991/gitsigns.nvim',
   event = {
      'BufReadPre',
      'BufNewFile',
   },
   opts = {},
}
