local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
   vim.fn.system({
      'git',
      'clone',
      '--filter=blob:none',
      'https://github.com/folke/lazy.nvim.git',
      '--branch=stable',
      lazypath,
   })
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
   spec = { import = 'sethen.plugins' },
   ui = {
      border = 'rounded',
      icons = {
         cmd = ' ',
         config = " ",
         event = " ",
         favorite = " ",
         ft = " ",
         init = " ",
         import = " ",
         keys = " ",
         lazy = " ",
         loaded = " ",
         not_loaded = " ",
         plugin = " ",
         runtime = " ",
         require = " ",
         source = " ",
         start = " ",
         task = " ",
         list = {
            "",
            "",
            "",
            "",
         },
      },
   },
})
