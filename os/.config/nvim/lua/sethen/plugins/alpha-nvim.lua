return {
   'goolord/alpha-nvim',
   event = 'VimEnter',
   dependencies = {
      'nvim-tree/nvim-web-devicons'
   },
   config = function()
      local alpha = require('alpha')
      local dashboard = require('alpha.themes.dashboard')

      dashboard.section.header.val = {
         '                                 ',
         '                                 ',
         '           ▄ ▄                   ',
         '       ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄     ',
         '       █ ▄ █▄█ ▄▄▄ █ █▄█ █ █     ',
         '    ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █     ',
         '  ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄  ',
         '  █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄',
         '▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █',
         '█▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █',
         '    █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█    ',
      }

      dashboard.section.buttons.val = {
         dashboard.button('n', '  New File', '<cmd>ene<CR>'),
         dashboard.button('SPC l', '  Lazy', '<cmd>Lazy<CR>'),
         dashboard.button('SPC t', '  File Tree', '<cmd>NvimTreeToggle<CR>'),
         dashboard.button('SPC fc', '  Find Command(s)', '<cmd>Telescope commands<CR>'),
         dashboard.button('SPC ff', '  Find File(s)', '<cmd>Telescope find_files<CR>'),
         dashboard.button('SPC fk', '  Find Keymap(s)', '<cmd>Telescope keymaps<CR>'),
         dashboard.button('SPC fp', '  Find Project(s)', "<cmd>Telescope neovim-project discover<CR>"),
         dashboard.button('SPC fr', '  Find Recent File(s)', '<cmd>Telescope oldfiles<CR>'),
         dashboard.button('SPC fs', '  Live Grep', '<cmd>Telescope live_grep<CR>'),
         dashboard.button('q', '  Quit', '<cmd>qa<CR>'),
      }

      vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])

      vim.api.nvim_create_autocmd('User', {
         pattern = 'LazyVimStarted',
         callback = function()
            local stats = require('lazy').stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            dashboard.section.footer.val = '  ' .. stats.count .. ' plugins in ' .. ms .. 'ms'
            pcall(vim.cmd.AlphaRedraw)
         end,
      })

      alpha.setup(dashboard.opts)
   end,
}
