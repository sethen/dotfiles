-- gives colors to hex values

return {
   'NvChad/nvim-colorizer.lua',
   event = {
      'BufReadPre',
      'BufNewFile',
   },
   opts = {},
}
